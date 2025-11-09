#!/usr/bin/env bash
# Create dataset ZIP containing all tracked (non-ignored) files.
# Works in Git Bash on Windows, macOS, and Linux.

set -euo pipefail

VERSION="2025-04-v3"
OUTDIR="dist"
ZIPNAME="civic-data-boundaries-us-mn-${VERSION}.zip"
ZIPPATH="${OUTDIR}/${ZIPNAME}"

mkdir -p "$OUTDIR"
echo "Creating dataset archive: $ZIPPATH"

# Generate list of tracked files (respects .gitignore automatically)
FILES=$(git ls-files)

if command -v zip >/dev/null 2>&1; then
  # -r is not needed when providing explicit file list; use -@ to read from stdin
  echo "$FILES" | zip -@ "$ZIPPATH"
else
  echo "zip command not found, using PowerShell fallback."
  # Convert file list to a PowerShell array and compress
  pwsh -Command "
    \$files = @($(echo "$FILES" | sed 's/^/\"/' | sed 's/$/\"/' | paste -sd, -))
    Compress-Archive -Force -Path \$files -DestinationPath '${ZIPPATH}'
  "
fi

echo "Done. Archive created at: $ZIPPATH"
