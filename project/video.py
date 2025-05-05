import json
import os
import subprocess

from tqdm import tqdm

jsonl_path = "/workspaces/eng-ai-agents/project/whole_merged_subtitles.jsonl"
video_dir = "/workspaces/eng-ai-agents/project/Gradio/static_clips"
output_dir = "/workspaces/eng-ai-agents/project/Gradio/video_clips"

os.makedirs(output_dir, exist_ok=True)


def sanitize_timestamp(ts: str) -> str:
    return ts.replace(":", "_").replace(" - ", "__")


with open(jsonl_path, "r", encoding="utf-8") as f:
    for line in tqdm(f, desc="Processing clips"):
        try:
            item = json.loads(line)
            video_file = f"{item['video']}.mkv"
            input_path = os.path.join(video_dir, video_file)

            if not os.path.exists(input_path):
                print(f"❌ Not found: {input_path}")
                continue

            start_time = item["start"]
            end_time = item["end"]
            timestamp_str = sanitize_timestamp(item["timestamp"])
            output_file = f"{item['video']}__{timestamp_str}.mp4"
            output_path = os.path.join(output_dir, output_file)

            command = [
                "ffmpeg",
                "-hide_banner",
                "-loglevel",
                "error",
                "-y",
                "-i",
                input_path,
                "-ss",
                start_time,
                "-to",
                end_time,
                "-c:v",
                "libx264",
                "-c:a",
                "aac",
                output_path,
            ]

            subprocess.run(command, check=True)

        except Exception as e:
            print(f"⚠️ Error for {item['video']} {item['timestamp']}: {e}")
