import hashlib
from typing import List

import requests
from mcp.server.fastmcp import FastMCP
from pydantic import BaseModel
from unified_planning.engines import PlanGenerationResultStatus
from unified_planning.io import PDDLReader
from unified_planning.shortcuts import OneshotPlanner

server = FastMCP("OpenRouter Planner Server")

TYPE_PREFIX_MAP = {
    "model": "model",
    "prov": "provider",
    "var": "variant",
    "tok": "tokens",
    "price": "price",
}


def fetch_models() -> dict:
    url = "https://openrouter.ai/api/v1/models"
    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json().get("data", [])
    except Exception as error:
        return {"models": [], "error": str(error)}

    model_list = []
    for item in data:
        model_id = item.get("id", "unknown")
        desc = item.get("description", "").lower()
        keywords = ["multilingual", "tool", "code", "reasoning", "instruction"]
        capabilities = [kw for kw in keywords if kw in desc]
        provider = model_id.split("/")[0]
        variant = model_id.split(":")[1] if ":" in model_id else "default"

        model_list.append(
            {
                "name": model_id,
                "provider": provider,
                "variant": variant,
                "capabilities": capabilities,
                "price": item.get("pricing", {}).get("prompt", "0"),
                "max_tokens": item.get("context_length", 4096),
            }
        )

    return {"models": model_list}


def run_planner(domain_text: str, problem_text: str) -> dict:
    reader = PDDLReader()
    problem = reader.parse_problem_string(domain_text, problem_text)

    for planner in ["pyperplan", "fast-downward", None]:
        try:
            with OneshotPlanner(name=planner) as engine:
                result = engine.solve(problem)
            if result.status == PlanGenerationResultStatus.SOLVED_SATISFICING:
                return {"plan": [str(act) for act in result.plan.actions]}
        except Exception as error:
            print(f"Planner {planner} failed: {error}")

    with open("problem.pddl", "w") as f:
        f.write(problem_text)
    return {"plan": ["No plan found."]}


class PlanResponse(BaseModel):
    plan: List[str]


def make_safe_id(prefix: str, raw: str) -> str:
    hash_part = hashlib.md5(raw.encode()).hexdigest()[:6]
    clean = raw.replace("/", "_").replace(":", "_").replace("-", "_").replace(".", "_")
    return f"{prefix}_{clean}_{hash_part}"


@server.tool()
async def assign_openrouter_model() -> PlanResponse:
    try:
        result = fetch_models()
        models = result.get("models", [])
        eligible = [
            m for m in models if "code" in m["capabilities"] and m["price"] == "0"
        ]
        if not eligible:
            raise ValueError("No free model found with code capability")

        user_id = "user1"
        req_id = "req1"
        need_capability = "code"
        token_amt = 2000
        budget_amt = 100

        token_obj = f"tok{token_amt}"
        budget_obj = f"budget{budget_amt}"

        object_defs = [
            f"{req_id} - request",
            f"{need_capability} - capability",
            f"{token_obj} - tokens",
            f"{budget_obj} - budget",
            f"{user_id} - user",
        ]

        init_facts = [
            f"(requires {req_id} {need_capability})",
            f"(request-tokens {req_id} {token_obj})",
            f"(user-budget {user_id} {budget_obj})",
        ]

        added = set()

        for model in eligible:
            mid = model["name"]
            prov = model["provider"]
            variant = model["variant"]

            model_ref = make_safe_id("model", mid)
            prov_ref = make_safe_id("prov", f"{mid}::{prov}")
            var_ref = make_safe_id("var", f"{mid}::{variant}")
            max_tok_ref = make_safe_id("tok", str(model["max_tokens"]))
            price_ref = make_safe_id("price", model["price"])

            for item in [model_ref, prov_ref, var_ref, max_tok_ref, price_ref]:
                if item not in added:
                    prefix = item.split("_")[0]
                    type_name = TYPE_PREFIX_MAP.get(prefix, "tokens")
                    object_defs.append(f"{item} - {type_name}")
                    added.add(item)

            init_facts += [
                f"(supports {model_ref} {need_capability})",
                f"(can-handle {model_ref} {req_id})",
                f"(model-available {model_ref})",
                f"(offered-by {model_ref} {prov_ref})",
                f"(variant-of {model_ref} {var_ref})",
                f"(provider-supports-variant {prov_ref} {var_ref})",
                f"(model-supports-variant {model_ref} {var_ref})",
                f"(max-tokens {model_ref} {max_tok_ref})",
                f"(price-per-million {model_ref} {prov_ref} {price_ref})",
                f"(token-compatible {token_obj} {max_tok_ref})",
                f"(within-budget {price_ref} {budget_obj})",
            ]

        with open("domain.pddl") as f:
            domain_text = f.read()

        problem_text = (
            "(define (problem assign-request)\n"
            "  (:domain openrouter-routing)\n"
            "  (:objects\n    " + "\n    ".join(object_defs) + "\n  )\n"
            "  (:init\n    " + "\n    ".join(init_facts) + "\n  )\n"
            f"  (:goal (exists (?m - model) (assigned {req_id} ?m)))\n"
            ")"
        )

        result = run_planner(domain_text, problem_text)
        return PlanResponse(plan=result["plan"])

    except Exception as e:
        import traceback

        traceback.print_exc()
        raise RuntimeError(f"assign_openrouter_model failed: {type(e).__name__}: {e}")


if __name__ == "__main__":
    server.run()
