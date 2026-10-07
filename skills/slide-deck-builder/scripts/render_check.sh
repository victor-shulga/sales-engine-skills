#!/usr/bin/env bash
# Render a .pptx to PDF and PNG thumbnails so every slide can be checked by eye.
# Usage: bash scripts/render_check.sh deck.pptx [out_dir]
# Needs LibreOffice (soffice) for PDF; pdftoppm (poppler) for PNGs. Without them it says so
# and exits 2, and the check falls back to the build warnings plus opening the file by hand.
set -euo pipefail

deck="${1:?usage: render_check.sh deck.pptx [out_dir]}"
out="${2:-$(dirname "$deck")/render}"
mkdir -p "$out"

SOFFICE="$(command -v soffice || command -v libreoffice || true)"
if [ -z "$SOFFICE" ] && [ -x "/Applications/LibreOffice.app/Contents/MacOS/soffice" ]; then
  SOFFICE="/Applications/LibreOffice.app/Contents/MacOS/soffice"
fi
if [ -z "$SOFFICE" ]; then
  echo "LibreOffice not found. Install it (macOS: brew install --cask libreoffice; Debian: apt install libreoffice-impress)"
  echo "or open $deck in PowerPoint/Keynote/Google Slides and check every slide by hand."
  exit 2
fi

"$SOFFICE" --headless --convert-to pdf --outdir "$out" "$deck" >/dev/null 2>&1
pdf="$out/$(basename "${deck%.*}").pdf"
[ -f "$pdf" ] || { echo "PDF conversion failed"; exit 1; }
echo "PDF: $pdf"

if command -v pdftoppm >/dev/null 2>&1; then
  pdftoppm -png -r 60 "$pdf" "$out/slide"
  echo "PNGs: $(ls "$out"/slide-*.png | wc -l | tr -d ' ') files in $out"
else
  echo "pdftoppm not found (install poppler) - check the PDF page by page instead."
fi
