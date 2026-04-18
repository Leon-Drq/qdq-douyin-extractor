---
name: douyin-extractor
description: Extract text/transcript from Douyin (TikTok China) videos. Use when the user wants to extract video captions, transcripts, or文案 from Douyin share links. Supports parsing Douyin URLs, downloading watermark-free videos, and using AI speech recognition to extract spoken content. Trigger phrases: "提取抖音文案", "抖音视频转文字", "douyin transcript", "提取抖音", "抖音文案".
---

# Douyin Extractor

Extract spoken text/transcript from Douyin (抖音) video share links.

## Requirements

- Local douyin-mcp-server installation at `~/.openclaw/workspace/douyin-mcp-server`
- API_KEY environment variable set for SiliconFlow (硅基流动) speech recognition
- Python 3.12+ with uv package manager

## Workflow

When user provides a Douyin share link and asks to extract文案/文字/转录:

1. **Extract the URL** from user's message (Douyin share links look like `https://v.douyin.com/xxxxx/`)

2. **Run extraction** using the local douyin-mcp-server:
   ```bash
   cd ~/.openclaw/workspace/douyin-mcp-server
   export API_KEY="<user_api_key>"
   uv run python douyin-video/scripts/douyin_downloader.py -l "<douyin_url>" -a extract -o ./output
   ```

3. **Read the transcript** from the generated markdown file:
   - Path: `~/.openclaw/workspace/douyin-mcp-server/output/<video_id>/transcript.md`

4. **Return the文案 content** to user

## API Key

The skill requires a SiliconFlow API key for speech recognition. User should provide it in the format:
- `api:sk-xxxxx` or just `sk-xxxxx`

If no API key is provided, ask the user for it.

## Output Format

The transcript file contains:
- Video title
- Extracted spoken text (in Chinese)
- Video metadata

Return the文案 content in a clean, readable format to the user.

## Notes

- Extraction involves downloading the video + audio processing + AI transcription
- This may take 30-90 seconds depending on video length
- The tool automatically handles videos up to 1 hour by splitting into segments
