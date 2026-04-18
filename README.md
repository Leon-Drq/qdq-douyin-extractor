# Douyin Extractor Skill

OpenClaw Skill for extracting text/transcript from Douyin (抖音) videos.

## Features

- 🎬 **Extract video transcripts** - Convert Douyin video speech to text
- 🔗 **Parse share links** - Works with `v.douyin.com` short links
- 🎙️ **AI speech recognition** - Uses SiliconFlow SenseVoice API
- 💾 **Local processing** - Downloads and processes videos locally
- 🚀 **Discord integration** - Use directly in Discord via @mention

## Installation

### Prerequisites

1. **Python 3.12+** and `uv` package manager:
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

2. **FFmpeg** for audio processing:
   ```bash
   # macOS
   brew install ffmpeg
   
   # Ubuntu/Debian
   sudo apt install ffmpeg
   ```

3. **Douyin MCP Server** (automatically installed by this skill):
   ```bash
   git clone https://github.com/yzfly/douyin-mcp-server.git
   cd douyin-mcp-server
   uv sync
   ```

4. **SiliconFlow API Key** - Get free API key at [cloud.siliconflow.cn](https://cloud.siliconflow.cn/i/TxUlXG3u)

### Setup

1. Clone this skill to your OpenClaw skills directory:
   ```bash
   git clone https://github.com/Leon-Drq/qdq-douyin-extractor.git ~/.openclaw/workspace/skills/douyin-extractor
   ```

2. Set your API key (optional - can provide per-request):
   ```bash
   export API_KEY="sk-your-api-key"
   ```

## Usage

### In Discord

Simply @mention your OpenClaw agent with a Douyin link:

```
@YourAgent 提取抖音文案：https://v.douyin.com/xxxxx/
```

Or just paste the link:
```
@YourAgent https://v.douyin.com/xxxxx/ 提取文案
```

### Command Line

```bash
cd ~/.openclaw/workspace/skills/douyin-extractor
./scripts/extract.sh "https://v.douyin.com/xxxxx/" "sk-your-api-key"
```

## How It Works

1. **Parse** the Douyin share link to get video metadata
2. **Download** the watermark-free video
3. **Extract** audio from the video
4. **Transcribe** using SiliconFlow SenseVoice API
5. **Return** the text transcript

## Output

The extracted文案 includes:
- Video title and metadata
- Full spoken text transcript (in Chinese)
- Formatted for easy reading

Example output:
```
视频标题：把产品卖点变成顾客买点

文案内容：
最差的卖点是你说了一堆产品多么牛，用户心里却在想，关我什么事...

1. 从用户的痛点倒推卖点...
2. 少用形容词和干巴巴的数字...
3. 把卖点绑在具体场景里...
```

## Supported URL Formats

- `https://v.douyin.com/xxxxx/` (short links)
- Full Douyin URLs with video IDs

## Limitations

- Requires valid SiliconFlow API key (free tier available)
- Video processing takes 30-90 seconds depending on length
- Supports videos up to 1 hour (automatically split into segments)

## Credits

- Built on [douyin-mcp-server](https://github.com/yzfly/douyin-mcp-server) by yzfly
- Speech recognition powered by [SiliconFlow](https://cloud.siliconflow.cn/)

## License

MIT License - See original [douyin-mcp-server](https://github.com/yzfly/douyin-mcp-server) for details.
