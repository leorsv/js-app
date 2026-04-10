# Sample JS App using Instructions

This is a demo project that consumes coding instructions from the centralized [instructions-platform](https://github.com/leorsv/instructions-platform).

## Setup

1. Clone this repo separately.
2. Run the sync script to pull the latest instructions from the platform:

```powershell
# Windows
./sync-instructions.ps1
```

```bash
# Mac/Linux
./sync-instructions.sh
```

3. Open the project in VS Code — Copilot will automatically use the synced instructions from `.github/copilot-instructions.md`.

## How it works

The sync script fetches the latest `javascript.md` from the instructions-platform GitHub repo and writes it into `.github/copilot-instructions.md`. Copilot reads this file on every request.
