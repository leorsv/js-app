# sync-instructions.ps1
# Fetches the latest JavaScript instructions from the instructions-platform and
# writes them into .github/copilot-instructions.md so Copilot picks them up.

$sourceUrl = "https://raw.githubusercontent.com/leorsv/instructions-platform/master/instructions/javascript.md"
$outputPath = ".github/copilot-instructions.md"

Write-Host "Fetching instructions from $sourceUrl ..."

$content = Invoke-WebRequest -Uri $sourceUrl -UseBasicParsing | Select-Object -ExpandProperty Content

$header = @"
# JavaScript Project — Copilot Instructions

> **Auto-synced from instructions-platform.**
> Source: ``$sourceUrl``
> Last synced: $(Get-Date -Format "yyyy-MM-dd HH:mm")
> Run ``./sync-instructions.ps1`` to pull the latest.

---

"@

New-Item -ItemType Directory -Force -Path ".github" | Out-Null
Set-Content -Path $outputPath -Value ($header + $content) -Encoding UTF8

Write-Host "Done. Instructions written to $outputPath"
