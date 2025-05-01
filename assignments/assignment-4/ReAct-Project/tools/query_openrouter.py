def main() -> dict:
    import requests

    url = "https://openrouter.ai/api/v1/models"
    try:
        resp = requests.get(url)
        resp.raise_for_status()
        json_data = resp.json()
        models_raw = json_data.get("data", [])
    except Exception as e:
        return {"models": [], "error": str(e)}

    models = []
    for m in models_raw:
        model_id = m.get("id", "unknown")
        description = m.get("description", "").lower()

        capability_keywords = [
            "multilingual",
            "tool",
            "code",
            "reasoning",
            "instruction",
        ]
        capabilities = [cap for cap in capability_keywords if cap in description]

        models.append(
            {
                "name": model_id,
                "capabilities": capabilities,
                "price": m.get("pricing", {}).get("prompt", "0"),
                "max_tokens": m.get("context_length", 4096),
            }
        )

    return {"models": models}
