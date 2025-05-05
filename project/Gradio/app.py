# import asyncio
# import os

# import gradio as gr
# import numpy as np
# import open_clip
# import requests
# import torch
# from qdrant_client import QdrantClient
# from sklearn.metrics.pairwise import cosine_similarity

# device = "cuda" if torch.cuda.is_available() else "cpu"


# model, _, preprocess = open_clip.create_model_and_transforms(
#     "ViT-B-32", pretrained="openai"
# )
# tokenizer = open_clip.get_tokenizer("ViT-B-32")
# model = model.to(device).eval()

# # Qdrant client
# client = QdrantClient(
#     url="https://0ed1052e-7f23-462b-ab8a-70aaa05c675f.us-west-2-0.aws.cloud.qdrant.io",
#     api_key=os.getenv(
#         "QDRANT_API_KEY",
#         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3MiOiJtIn0.svTWXXiOcA-W59rQFl-g_qekNafaa95ozDuL3lq6s_4",
#     ),
# )
# COLLECTION_NAME = "Video_RAG"
# OLLAMA_API = os.getenv("OLLAMA_API", "http://host.docker.internal:11434")


# def encode_query_text(text):
#     tokens = tokenizer([text]).to(device)
#     with torch.no_grad():
#         vec = model.encode_text(tokens).squeeze().cpu().numpy()
#     return vec


# def retrieve_video_chunks_hybrid(query, top_k=6):
#     query_vec = encode_query_text(query)
#     results = client.scroll(
#         collection_name=COLLECTION_NAME, scroll_filter=None, limit=1000
#     )
#     all_chunks = [r.payload for r in results[0]]
#     if not all_chunks:
#         return []

#     vecs = [encode_query_text(c["text"]) for c in all_chunks]
#     sims = cosine_similarity([query_vec], vecs)[0]
#     top_vec_idxs = np.argsort(sims)[::-1][:top_k]

#     query_keywords = query.lower().split()
#     keyword_scores = []
#     for i, c in enumerate(all_chunks):
#         text = c.get("text", "").lower()
#         score = sum(1 for kw in query_keywords if kw in text)
#         if score > 0:
#             keyword_scores.append((i, score))
#     keyword_scores.sort(key=lambda x: -x[1])
#     top_kw_idxs = [idx for idx, _ in keyword_scores[:top_k]]

#     top_vec_chunks = [all_chunks[i] for i in top_vec_idxs if i < len(all_chunks)]
#     top_kw_chunks = [all_chunks[i] for i in top_kw_idxs if i < len(all_chunks)]
#     return top_vec_chunks + top_kw_chunks


# def query_ollama_summary_filtered(user_question, chunks):
#     full_text = "\n".join(f"[{i + 1}] {c['text']}" for i, c in enumerate(chunks))
#     prompt = (
#         f'You are given transcript excerpts from a video. The user asked: "{user_question}"\n\n'
#         f"Here are the excerpts:\n{full_text}\n\n"
#         f"First summarize all excerpts briefly in 1-2 sentence.\n"
#         f"Then list 4 to 6 key takeaways, each in 1 paragraph, starting with 1., 2., etc.\n"
#         f"Do NOT include headings or explanation. No markdown.\n"
#         f"Output only the following format:\n"
#         f"<Short paragraph>\n1. <key idea>\n2. <key idea>\n... up to 6"
#     )
#     try:
#         resp = requests.post(
#             f"{OLLAMA_API}/api/chat",
#             json={
#                 "model": "llama3",
#                 "messages": [{"role": "user", "content": prompt}],
#                 "stream": False,
#             },
#             timeout=60,
#         )
#         data = resp.json()
#         return data.get("message", {}).get("content", "").strip()
#     except Exception as e:
#         return f"(Error: {str(e)})"


# def format_timestamp(ts):
#     return (
#         ts
#         if isinstance(ts, str)
#         else f"{int(ts.total_seconds() // 3600)}:{int((ts.total_seconds() % 3600) // 60):02}:{int(ts.total_seconds() % 60):02}"
#     )


# async def stream_chat(user_message, chatbot):
#     chatbot.append([user_message, "..."])
#     yield chatbot

#     chunks = retrieve_video_chunks_hybrid(user_message, top_k=6)
#     raw = query_ollama_summary_filtered(user_message, chunks)
#     lines = [line.strip() for line in raw.split("\n") if line.strip()]
#     summary = lines[0] if lines else "(No summary)"
#     key_points = [line for line in lines[1:] if line[0].isdigit() and line[1] == "."]
#     while len(key_points) < 4:
#         key_points.append("(no point)")

#     full_response = summary + "\n\n"
#     for i, (point, chunk) in enumerate(zip(key_points, chunks)):
#         vid = chunk.get("video", "unknown")
#         ts = format_timestamp(chunk.get("start", "00:00:00"))
#         full_response += f"{i + 1}. {point[2:].strip()} (video {vid}, {ts})\n"

#     for j in range(1, len(full_response) + 1):
#         yield chatbot[:-1] + [[user_message, full_response[:j]]]
#         await asyncio.sleep(0.005)


# # UI
# with gr.Blocks(
#     css="""
#     body {
#         background-color: #1e1e1e;
#         color: #d4d4d4;
#         font-family: 'Inter', 'Helvetica Neue', 'Segoe UI', sans-serif;
#     }
#     .gr-chatbot {
#         background-color: #2e2e2e !important;
#         color: #d4d4d4 !important;
#         border-radius: 1.5rem !important;
#         padding: 0.5rem !important;
#     }
#     .gr-textbox textarea {
#         background-color: #2b2b2b !important;
#         color: #fff !important;
#         border-radius: 1.5rem !important;
#         padding: 0.9rem 1rem !important;
#         font-size: 1rem;
#         resize: none;
#     }
# """
# ) as demo:
#     gr.Markdown("## RAG", elem_id="title")
#     chatbot = gr.Chatbot(height=600, show_label=False)

#     msg = gr.Textbox(show_label=False, placeholder="Ask a question...")

#     async def user_ask(message, chat_history):
#         async for update in stream_chat(message, chat_history):
#             yield update, ""

#     msg.submit(fn=user_ask, inputs=[msg, chatbot], outputs=[chatbot, msg])


# if __name__ == "__main__":
#     demo.launch(debug=True)


import asyncio
import os

import gradio as gr
import numpy as np
import open_clip
import requests
import torch
from qdrant_client import QdrantClient
from sklearn.metrics.pairwise import cosine_similarity

device = "cuda" if torch.cuda.is_available() else "cpu"

model, _, preprocess = open_clip.create_model_and_transforms(
    "ViT-B-32", pretrained="openai"
)
tokenizer = open_clip.get_tokenizer("ViT-B-32")
model = model.to(device).eval()

client = QdrantClient(
    url="https://0ed1052e-7f23-462b-ab8a-70aaa05c675f.us-west-2-0.aws.cloud.qdrant.io",
    api_key=os.getenv(
        "QDRANT_API_KEY",
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3MiOiJtIn0.svTWXXiOcA-W59rQFl-g_qekNafaa95ozDuL3lq6s_4",
    ),
)
COLLECTION_NAME = "Video_RAG"
OLLAMA_API = os.getenv("OLLAMA_API", "http://host.docker.internal:11434")

VIDEO_CLIP_DIR = "/workspaces/eng-ai-agents/project/Gradio/video_clips"


def encode_query_text(text):
    tokens = tokenizer([text]).to(device)
    with torch.no_grad():
        vec = model.encode_text(tokens).squeeze().cpu().numpy()
    return vec


def retrieve_video_chunks_hybrid(query, top_k=6):
    query_vec = encode_query_text(query)
    results = client.scroll(
        collection_name=COLLECTION_NAME, scroll_filter=None, limit=1000
    )
    all_chunks = [r.payload for r in results[0]]
    if not all_chunks:
        return []

    vecs = [encode_query_text(c["text"]) for c in all_chunks]
    sims = cosine_similarity([query_vec], vecs)[0]
    top_vec_idxs = np.argsort(sims)[::-1][:top_k]

    query_keywords = query.lower().split()
    keyword_scores = []
    for i, c in enumerate(all_chunks):
        text = c.get("text", "").lower()
        score = sum(1 for kw in query_keywords if kw in text)
        if score > 0:
            keyword_scores.append((i, score))
    keyword_scores.sort(key=lambda x: -x[1])
    top_kw_idxs = [idx for idx, _ in keyword_scores[:top_k]]

    top_vec_chunks = [all_chunks[i] for i in top_vec_idxs if i < len(all_chunks)]
    top_kw_chunks = [all_chunks[i] for i in top_kw_idxs if i < len(all_chunks)]
    return top_vec_chunks + top_kw_chunks


def query_ollama_summary_filtered(user_question, chunks):
    full_text = "\n".join(f"[{i + 1}] {c['text']}" for i, c in enumerate(chunks))
    prompt = (
        f'You are given transcript excerpts from a video. The user asked: "{user_question}"\n\n'
        f"Here are the excerpts:\n{full_text}\n\n"
        f"First summarize all excerpts briefly in 1-2 sentence.\n"
        f"Then list 4 to 6 key takeaways, each in 1 paragraph, starting with 1., 2., etc.\n"
        f"Do NOT include headings or explanation. No markdown.\n"
        f"Output only the following format:\n"
        f"<Short paragraph>\n1. <key idea>\n2. <key idea>\n... up to 6"
    )
    try:
        resp = requests.post(
            f"{OLLAMA_API}/api/chat",
            json={
                "model": "llama3",
                "messages": [{"role": "user", "content": prompt}],
                "stream": False,
            },
            timeout=60,
        )
        data = resp.json()
        return data.get("message", {}).get("content", "").strip()
    except Exception as e:
        return f"(Error: {str(e)})"


def format_timestamp(ts):
    return (
        ts
        if isinstance(ts, str)
        else f"{int(ts.total_seconds() // 3600)}:{int((ts.total_seconds() % 3600) // 60):02}:{int(ts.total_seconds() % 60):02}"
    )


def get_clip_path(chunk):
    ts_str = chunk.get("timestamp", "").replace(":", "_").replace(" - ", "__")
    filename = f"{chunk['video']}__{ts_str}.mp4"
    path = os.path.join(VIDEO_CLIP_DIR, filename)
    return path if os.path.exists(path) else None


async def stream_chat(user_message, chatbot):
    chatbot.append([user_message, "..."])
    yield chatbot, "", None

    chunks = retrieve_video_chunks_hybrid(user_message, top_k=6)
    raw = query_ollama_summary_filtered(user_message, chunks)
    lines = [line.strip() for line in raw.split("\n") if line.strip()]
    summary = lines[0] if lines else "(No summary)"
    key_points = [line for line in lines[1:] if line[0].isdigit() and line[1] == "."]
    while len(key_points) < 4:
        key_points.append("(no point)")

    full_response = summary + "\n\n"
    for i, (point, chunk) in enumerate(zip(key_points, chunks)):
        vid = chunk.get("video", "unknown")
        ts = format_timestamp(chunk.get("start", "00:00:00"))
        full_response += f"{i + 1}. {point[2:].strip()} (video {vid}, {ts})\n"

    clip_paths = [get_clip_path(c) for c in chunks]
    clip_paths = [p for p in clip_paths if p]

    for j in range(1, len(full_response) + 1):
        yield chatbot[:-1] + [[user_message, full_response[:j]]], "", None
        await asyncio.sleep(0.004)

    yield (
        chatbot[:-1] + [[user_message, full_response]],
        "",
        [(p, p) for p in clip_paths],
    )


# -------------------- UI --------------------
with gr.Blocks(
    css="""
    body {
        background-color: #1e1e1e;
        color: #d4d4d4;
        font-family: 'Inter', 'Helvetica Neue', 'Segoe UI', sans-serif;
    }
    .gr-chatbot {
        background-color: #2e2e2e !important;
        color: #d4d4d4 !important;
        border-radius: 1.5rem !important;
        padding: 0.5rem !important;
    }
    .gr-textbox textarea {
        background-color: #2b2b2b !important;
        color: #fff !important;
        border-radius: 1.5rem !important;
        padding: 0.9rem 1rem !important;
        font-size: 1rem;
        resize: none;
    }
"""
) as demo:
    gr.Markdown("## 🎥 RAG Video QA Assistant")
    chatbot = gr.Chatbot(height=600, show_label=False)
    msg = gr.Textbox(show_label=False, placeholder="Ask a question...")

    video_gallery = gr.Gallery(
        label="🎬 Related Clips", show_label=True, columns=1, height=300
    )

    async def user_ask(message, chat_history):
        async for chat, cleared, videos in stream_chat(message, chat_history):
            yield chat, cleared, videos if videos else gr.update()

    msg.submit(
        fn=user_ask, inputs=[msg, chatbot], outputs=[chatbot, msg, video_gallery]
    )

if __name__ == "__main__":
    demo.launch(debug=True)
