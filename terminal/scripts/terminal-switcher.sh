#!/bin/bash

# 🍆💦 TERMINAL MODE SWITCHER 💋🔥
# Switch between Degenerate, Horny, and Normal terminal themes

MODE=$1
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

# Colors for output
PINK='\033[38;5;205m'
HOT_PINK='\033[38;5;198m'
RED='\033[38;5;196m'
GREEN='\033[38;5;82m'
RESET='\033[0m'

detect_terminal() {
    if [ -n "$KITTY_WINDOW_ID" ]; then
        echo "kitty"
    elif [ -n "$KONSOLE_VERSION" ]; then
        echo "konsole"
    elif [ -n "$ALACRITTY_WINDOW_ID" ]; then
        echo "alacritty"
    else
        echo "unknown"
    fi
}

switch_kitty() {
    local mode=$1
    
    if [ -f "$CONFIG_DIR/kitty/kitty-$mode.conf" ]; then
        cp "$CONFIG_DIR/kitty/kitty-$mode.conf" "$CONFIG_DIR/kitty/kitty.conf"
        
        # Reload kitty config
        kill -SIGUSR1 $(pgrep -a kitty | head -1 | awk '{print $1}') 2>/dev/null || true
        
        echo -e "${GREEN}✅ Kitty switched to $mode mode${RESET}"
    else
        echo -e "${RED}❌ Kitty config for $mode not found${RESET}"
    fi
}

switch_konsole() {
    local mode=$1
    local profile_name
    local color_scheme
    
    case $mode in
        degenerate)
            profile_name="DegenerateSlut"
            color_scheme="DegenerateSlut"
            ;;
        horny)
            profile_name="HornySlut"
            color_scheme="HornySlut"
            ;;
        normal)
            profile_name="NormalClean"
            color_scheme="NormalClean"
            ;;
    esac
    
    # Create/update konsole profile
    mkdir -p "$CONFIG_DIR/konsole"
    
    cat > "$CONFIG_DIR/konsole/$profile_name.profile" << EOF
[General]
Name=$profile_name
Parent=FALLBACK/

[Appearance]
ColorScheme=$color_scheme
Font=JetBrainsMono Nerd Font,12,-1,5,50,0,0,0,0,0

[Scrolling]
HistoryMode=2
ScrollBottomRightOnInput=false
EOF
    
    # Set as default profile
    kwriteconfig5 --file konsolerc --group "Desktop Entry" --key DefaultProfile "$profile_name.profile"
    
    echo -e "${GREEN}✅ Konsole switched to $mode mode${RESET}"
    echo -e "${PINK}   Restart Konsole to see changes${RESET}"
}

switch_shell_prompt() {
    local mode=$1
    
    # Switch bash prompt
    if [ -f "$CONFIG_DIR/slutterminal/bash-$mode.sh" ]; then
        cp "$CONFIG_DIR/slutterminal/bash-$mode.sh" "$CONFIG_DIR/slutterminal/bash-current.sh"
        echo -e "${GREEN}✅ Bash prompt switched to $mode mode${RESET}"
    fi
    
    # Switch zsh prompt
    if [ -f "$CONFIG_DIR/slutterminal/zsh-$mode.zsh" ]; then
        cp "$CONFIG_DIR/slutterminal/zsh-$mode.zsh" "$CONFIG_DIR/slutterminal/zsh-current.zsh"
        echo -e "${GREEN}✅ Zsh prompt switched to $mode mode${RESET}"
    fi
}

apply_degenerate() {
    echo -e "${RED}🔥 SWITCHING TO DEGENERATE TERMINAL MODE 🔥${RESET}"
    
    local term=$(detect_terminal)
    
    case $term in
        kitty)
            switch_kitty "degenerate"
            ;;
        konsole)
            switch_konsole "degenerate"
            ;;
        *)
            echo -e "${HOT_PINK}💋 Terminal not detected, switching shell prompts only...${RESET}"
            ;;
    esac
    
    switch_shell_prompt "degenerate"
    
    echo -e "${RED}🍆 Degenerate mode active! Maximum filth engaged! 💦${RESET}"
}

apply_horny() {
    echo -e "${HOT_PINK}💦 SWITCHING TO HORNY TERMINAL MODE 💕${RESET}"
    
    local term=$(detect_terminal)
    
    case $term in
        kitty)
            switch_kitty "horny"
            ;;
        konsole)
            switch_konsole "horny"
            ;;
        *)
            echo -e "${HOT_PINK}💋 Terminal not detected, switching shell prompts only...${RESET}"
            ;;
    esac
    
    switch_shell_prompt "horny"
    
    echo -e "${HOT_PINK}🌹 Horny mode active! Sensual vibes engaged! 💋${RESET}"
}

apply_normal() {
    echo -e "${GREEN}✨ SWITCHING TO NORMAL TERMINAL MODE 🖥️${RESET}"
    
    local term=$(detect_terminal)
    
    case $term in
        kitty)
            switch_kitty "normal"
            ;;
        konsole)
            switch_konsole "normal"
            ;;
        *)
            echo -e "${HOT_PINK}💋 Terminal not detected, switching shell prompts only...${RESET}"
            ;;
    esac
    
    switch_shell_prompt "normal"
    
    echo -e "${GREEN}🖥️  Normal mode active! Clean and professional! ✨${RESET}"
}

# Main
case $MODE in
    degenerate|DEGENERATE|d|D)
        apply_degenerate
        ;;
    horny|HORNY|h|H)
        apply_horny
        ;;
    normal|NORMAL|n|N|clean|CLEAN|c|C)
        apply_normal
        ;;
    *)
        echo "Usage: terminal-switcher.sh [degenerate|horny|normal]"
        echo ""
        echo "Modes:"
        echo "  degenerate - Deep pink/purple, 85% opacity"
        echo "  horny      - Rose/coral, 70% opacity"
        echo "  normal     - Clean, no opacity"
        exit 1
        ;;
esac
