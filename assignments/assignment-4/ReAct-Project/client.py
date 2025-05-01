# client.py
import asyncio
import os
import sys

from mcp import ClientSession
from mcp.client.stdio import StdioServerParameters, stdio_client


async def main():
    server_params = StdioServerParameters(
        command=sys.executable,
        args=["server.py"],
        env=os.environ,
    )

    async with stdio_client(server_params) as (read, write):
        async with ClientSession(read, write) as session:
            await session.initialize()
            result = await session.call_tool("assign_openrouter_model", {})
            print("Tool Output:")
            print(result.content[0].text)


if __name__ == "__main__":
    asyncio.run(main())
