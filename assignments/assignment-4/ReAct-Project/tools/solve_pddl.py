import tempfile

from unified_planning.engines import PlanGenerationResultStatus
from unified_planning.io import PDDLReader
from unified_planning.shortcuts import OneshotPlanner


def solve_pddl_problem(domain_pddl: str, problem_pddl: str):
    with tempfile.NamedTemporaryFile("w+", suffix=".pddl", delete=False) as d_f:
        d_f.write(domain_pddl)
        d_f.flush()
        domain_path = d_f.name

    with tempfile.NamedTemporaryFile("w+", suffix=".pddl", delete=False) as p_f:
        p_f.write(problem_pddl)
        p_f.flush()
        problem_path = p_f.name

    reader = PDDLReader()
    problem = reader.parse_problem(domain_path, problem_path)

    with OneshotPlanner(name="pyperplan") as planner:
        result = planner.solve(problem)

    if result.status == PlanGenerationResultStatus.SOLVED_SATISFICING:
        return {"plan": [str(action) for action in result.plan.actions]}
    else:
        return {"plan": []}
