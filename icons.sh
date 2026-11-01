#!/bin/sh
# Render the home-screen icons from icon.svg (needs rsvg-convert + python3/Pillow)
set -e
cd "$(dirname "$0")"
for spec in apple-touch-icon.png:180 icon-192.png:192 icon-512.png:512; do
  f=${spec%%:*}; s=${spec##*:}
  rsvg-convert -w "$s" -h "$s" icon.svg -o "$f"
  # iOS wants an opaque square; strip the alpha channel
  python3 -c "from PIL import Image;im=Image.open('$f').convert('RGB');im.save('$f',optimize=True)"
done
