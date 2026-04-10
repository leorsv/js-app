#!/usr/bin/env bash
# sync-instructions.sh
# Fetches the latest JavaScript instructions from the instructions-platform and
# writes them into .github/copilot-instructions.md so Copilot picks them up.

SOURCE_URL="https://raw.githubusercontent.com/leorsv/instructions-platform/master/instructions/javascript.md"
OUTPUT_PATH=".github/copilot-instructions.md"

echo "Fetching instructions from $SOURCE_URL ..."

content=$(curl -fsSL "$SOURCE_URL")

mkdir -p .github

cat > "$OUTPUT_PATH" <<EOF
# JavaScript Project — Copilot Instructions

> **Auto-synced from instructions-platform.**
> Source: \`$SOURCE_URL\`
> Last synced: $(date -u +"%Y-%m-%d %H:%M UTC")
> Run \`./sync-instructions.sh\` to pull the latest.

---

$content
EOF

echo "Done. Instructions written to $OUTPUT_PATH"
