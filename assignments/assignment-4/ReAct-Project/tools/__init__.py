# tools/__init__.py
from tools.registry import register_tool
from tools.solve_pddl import solve_pddl_problem

register_tool("planner.solve_pddl_problem", solve_pddl_problem)
