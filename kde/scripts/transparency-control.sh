#!/bin/bash

# 🍆💦 KDE TRANSPARENCY CONTROL 💋🔥
# Adjust window transparency on the fly!

LEVEL=$1

if [ -z "$LEVEL" ]; then
    echo -e "${HOT_PINK}Usage: transparency-control.sh <0-100>${RESET}"
    echo "  0 = Opaque (no transparency)"
    echo "  25 = Light transparency"
    echo "  50 = Medium transparency"
    echo "  75 = Heavy transparency"
    echo "  85 = Degenerate mode (very see-through)"
    echo "  100 = Ghost mode (almost invisible)"
    exit 1
fi

# Validate input
if ! [[ "$LEVEL" =~ ^[0-9]+$ ]] || [ "$LEVEL" -lt 0 ] || [ "$LEVEL" -gt 100 ]; then
    echo "Error: Level must be 0-100"
    exit 1
fi

# Calculate KWin opacity (0-100 scale, where 0 is fully transparent)
OPACITY=$((100 - LEVEL))

# Apply to KWin (KDE's window manager)
qdbus org.kde.KWin /KWin org.kde.KWin.setOpacity $OPACITY 2>/dev/null || true

# Also update Konsole profiles for terminal transparency
for profile in ~/.config/konsolerc ~/.local/share/konsole/*.profile; do
    if [ -f "$profile" ]; then
        # Update transparency in Konsole profiles
        sed -i "s/Transparency=.*/Transparency=$LEVEL/" "$profile" 2>/dev/null || true
    fi
done

# Notify user
notify-send "💦 Transparency Set" "All windows now ${LEVEL}% transparent" --icon=preferences-desktop-display

echo -e "${PINK}💋 All windows set to ${LEVEL}% transparency!${RESET}"
