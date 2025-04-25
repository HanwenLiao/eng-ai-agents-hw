TOOL_REGISTRY = {}


def register_tool(name, func):
    TOOL_REGISTRY[name] = func


def get_tool(name):
    if name not in TOOL_REGISTRY:
        raise ValueError(f"Tool '{name}' not registered.")
    return TOOL_REGISTRY[name]
