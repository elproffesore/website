#!/bin/bash

# Directory to start from (defaults to current dir if not provided)
BASE_DIR="${1:-.}"

# Quality setting (WebP quality scale: 0–100)
QUALITY=80

# Find all PNG files recursively
find "$BASE_DIR" -type f -iname "*.png" | while read -r file; do
    dir=$(dirname "$file")
    base=$(basename "$file" .png)
    output="$dir/$base.webp"

    # Convert if not already converted
    if [ ! -f "$output" ]; then
        echo "Converting: $file → $output"
        ffmpeg -i "$file" -c:v libwebp -q:v $QUALITY "$output" -y
    else
        echo "Skipping (already exists): $output"
    fi
done

