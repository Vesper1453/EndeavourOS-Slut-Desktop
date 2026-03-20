#!/bin/bash

# 🍆💦 TRANSPARENCY HOTKEY SETUP 💋🔥
# Add these to KDE System Settings → Shortcuts

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to set transparency
set_transparency() {
    local level=$1
    local name=$2
    
    # Update all active Konsole windows
    for pid in $(pgrep konsole); do
        qdbus org.kde.konsole-$pid /konsole/MainWindow_1 org.kde.KMainWindow.setAlpha $((100-level)) 2>/dev/null || true
    done
    
    # Use xprop for other windows (requires xorg-xprop)
    if command -v xprop &> /dev/null; then
        # This sets transparency via X11 properties
        for win in $(xdotool search --onlyvisible --class "" 2>/dev/null); do
            xprop -id $win -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY $((level * 42949673)) 2>/dev/null || true
        done
    fi
    
    notify-send "🍆 $name" "Transparency: ${level}%" --icon=preferences-desktop-theme
}

# Main
case "$1" in
    opaque|0)
        set_transparency 0 "Opaque Mode"
        ;;
    light|25)
        set_transparency 25 "Light Transparency"
        ;;
    medium|50)
        set_transparency 50 "Medium Transparency"
        ;;
    heavy|75)
        set_transparency 75 "Heavy Transparency 💦"
        ;;
    degenerate|85)
        set_transparency 85 "Degenerate Mode 🔥"
        ;;
    ghost|100)
        set_transparency 100 "Ghost Mode 👻"
        ;;
    up|+)
        # Increase transparency by 10%
        CURRENT=$(cat ~/.config/slutdesktop/transparency_level 2>/dev/null || echo 50)
        NEW=$((CURRENT + 10))
        [ $NEW -gt 100 ] && NEW=100
        echo $NEW > ~/.config/slutdesktop/transparency_level
        set_transparency $NEW "Transparency +10%"
        ;;
    down|-)
        # Decrease transparency by 10%
        CURRENT=$(cat ~/.config/slutdesktop/transparency_level 2>/dev/null || echo 50)
        NEW=$((CURRENT - 10))
        [ $NEW -lt 0 ] && NEW=0
        echo $NEW > ~/.config/slutdesktop/transparency_level
        set_transparency $NEW "Transparency -10%"
        ;;
    *)
        echo "Usage: transparency-hotkeys.sh [opaque|light|medium|heavy|degenerate|ghost|up|down|<0-100>]"
        exit 1
        ;;
esac
