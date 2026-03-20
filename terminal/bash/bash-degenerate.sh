#!/bin/bash

# 🍆💦 DEGENERATE BASH PROMPT - MAXIMUM FILTH 💋🔥
# Add to ~/.bashrc: source ~/.config/slutterminal/bash-degenerate.sh

# Colors
DEGEN_BLACK='\[\033[38;5;232m\]'
DEGEN_DEEP_PINK='\[\033[38;5;197m\]'
DEGEN_HOT_PINK='\[\033[38;5;205m\]'
DEGEN_PURPLE='\[\033[38;5;93m\]'
DEGEN_RED='\[\033[38;5;196m\]'
DEGEN_MAGENTA='\[\033[38;5;201m\]'
RESET='\[\033[0m\]'

# Slutty symbols
CUM_DROP='💦'
PEACH='🍑'
EGGPLANT='🍆'
LIPS='💋'
FIRE='🔥'

# Function to show git branch
git_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo " $DEGEN_HOT_PINK($LIPS $branch $LIPS)$RESET"
    fi
}

# Function to show if last command failed
last_status() {
    local status=$?
    if [ $status -ne 0 ]; then
        echo " $DEGEN_RED✗$RESET"
    else
        echo " $DEGEN_HOT_PINK✓$RESET"
    fi
}

# Build the prompt
build_prompt() {
    # Mode indicator
    local mode="${DEGEN_RED}$FIRE${DEGEN_HOT_PINK}DEGENERATE${DEGEN_RED}$FIRE${RESET}"
    
    # Username with cum drop
    local user="${DEGEN_MAGENTA}${CUM_DROP} \u ${CUM_DROP}${RESET}"
    
    # Host with eggplant
    local host="${DEGEN_PURPLE}${EGGPLANT} \h ${EGGPLANT}${RESET}"
    
    # Path with peach
    local path="${DEGEN_DEEP_PINK}${PEACH} \w ${PEACH}${RESET}"
    
    # Git branch
    local git=$(git_branch)
    
    # Status
    local status=$(last_status)
    
    # Combine
    PS1="\n${mode}\n${user}${DEGEN_PURPLE}@${RESET}${host}\n${path}${git}${status}\n${DEGEN_HOT_PINK}╰─➤ ${RESET}"
}

# Set the prompt
PROMPT_COMMAND='build_prompt'

# Title bar
case "$TERM" in
    xterm*|rxvt*|konsole*|kitty*|alacritty*)
        PS1="\[\e]0;🍆💦 \u@\h 💦🍆\a\]$PS1"
        ;;
esac

# Alias section
declare -A DEGEN_ALIASES=(
    ["porn"]="firefox https://pornhub.com"
    ["hentai"]="firefox https://hentaihaven.org"
    ["cam"]="firefox https://chaturbate.com"
    ["rule34"]="firefox https://rule34.xxx"
    ["spank"]="firefox https://spankbang.com"
    ["filthy"]="cmatrix -C magenta"
    ["cum"]="echo '💦💦💦' | lolcat"
    ["slut"]="neofetch --ascii_distros degenerate | lolcat"
    ["panic"]="~/.config/i3/scripts/panic-button"
)

for alias_name in "${!DEGEN_ALIASES[@]}"; do
    alias "$alias_name"="${DEGEN_ALIASES[$alias_name]}"
done

# Fortune on startup
echo ""
fortune -s | cowsay -f sodomized | lolcat 2>/dev/null || echo "🍆 Welcome to Degenerate Mode 💦" | lolcat
echo ""
