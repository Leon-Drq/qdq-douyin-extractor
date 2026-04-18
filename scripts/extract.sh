#!/bin/bash
# Douyin Video Transcript Extractor
# Usage: ./extract.sh <douyin_url> <api_key>

set -e

DOUYIN_URL="$1"
API_KEY="$2"
PROJECT_DIR="$HOME/.openclaw/workspace/douyin-mcp-server"

if [ -z "$DOUYIN_URL" ] || [ -z "$API_KEY" ]; then
    echo "Usage: $0 <douyin_url> <api_key>"
    exit 1
fi

cd "$PROJECT_DIR"
export API_KEY="$API_KEY"

# Run extraction
uv run python douyin-video/scripts/douyin_downloader.py -l "$DOUYIN_URL" -a extract -o ./output

# Find the latest transcript file
TRANSCRIPT_FILE=$(find ./output -name "transcript.md" -type f -exec ls -t {} + | head -1)

if [ -f "$TRANSCRIPT_FILE" ]; then
    cat "$TRANSCRIPT_FILE"
else
    echo "Error: Transcript file not found"
    exit 1
fi
