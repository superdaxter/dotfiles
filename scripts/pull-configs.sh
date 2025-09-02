#!/usr/bin/env bash
set -euo pipefail

# Folders to include
INCLUDE=(gtk-2.0 gtk-3.0 gtk-4.0 hypr kitty waybar waypaper wlogout wofi)

SRC_DIR="$HOME/.config"
DEST_DIR="$(dirname "$(realpath "$0")")/.."

for folder in "${INCLUDE[@]}"; do
    src="$SRC_DIR/$folder"
    dest="$DEST_DIR/$folder"

    if [[ -d "$src" ]]; then
        echo "Updating $dest from $src"
        rm -rf "$dest"
        mkdir -p "$dest"
        cp -r "$src"/* "$dest"/
    else
        echo "⚠️  Skipping $folder (not found in $SRC_DIR)"
    fi
done

echo "✅ dotfiles repo updated from ~/.config/"

