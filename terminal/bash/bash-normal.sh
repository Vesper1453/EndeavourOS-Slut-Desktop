#!/bin/bash

# ✨ NORMAL BASH PROMPT - CLEAN & PROFESSIONAL 🖥️
# Add to ~/.bashrc: source ~/.config/slutterminal/bash-normal.sh

# Colors
NORMAL_GRAY='\[\033[38;5;245m\]'
NORMAL_BLUE='\[\033[38;5;75m\]'
NORMAL_GREEN='\[\033[38;5;82m\]'
NORMAL_YELLOW='\[\033[38;5;226m\]'
NORMAL_RED='\[\033[38;5;196m\]'
RESET='\[\033[0m\]'

# Symbols
GEAR='⚙️'
USER_ICON='👤'
PC_ICON='💻'
FOLDER='📁'
CHECK='✓'
CROSS='✗'

# Function to show git branch
git_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo " ${NORMAL_BLUE}(${branch})${RESET}"
    fi
}

# Function to show if last command failed
last_status() {
    local status=$?
    if [ $status -ne 0 ]; then
        echo " ${NORMAL_RED}${CROSS}${RESET}"
    else
        echo " ${NORMAL_GREEN}${CHECK}${RESET}"
    fi
}

# Build the prompt
build_prompt() {
    # Username
    local user="${NORMAL_BLUE}${USER_ICON} \u${RESET}"
    
    # Host
    local host="${NORMAL_GRAY}${PC_ICON} \h${RESET}"
    
    # Path
    local path="${NORMAL_YELLOW}${FOLDER} \w${RESET}"
    
    # Git branch
    local git=$(git_branch)
    
    # Status
    local status=$(last_status)
    
    # Combine - clean, professional
    PS1="${user}${NORMAL_GRAY}@${RESET}${host} ${path}${git}${status}\n${NORMAL_BLUE}\$ ${RESET}"
}

# Set the prompt
PROMPT_COMMAND='build_prompt'

# Title bar
case "$TERM" in
    xterm*|rxvt*|konsole*|kitty*|alacritty*)
        PS1="\[\e]0;\u@\h\a\]$PS1"
        ;;
esac

# Clean aliases - no adult content
declare -A NORMAL_ALIASES=(
    ["ll"]="ls -la --color=auto"
    ["la"]="ls -A --color=auto"
    ["l"]="ls -CF --color=auto"
    [".."]="cd .."
    ["..."]="cd ../.."
    ["update"]="sudo pacman -Syu"
    ["search"]="pacman -Ss"
    ["install"]="sudo pacman -S"
    ["remove"]="sudo pacman -R"
    ["clean"]="sudo pacman -Sc"
)

for alias_name in "${!NORMAL_ALIASES[@]}"; do
    alias "$alias_name"="${NORMAL_ALIASES[$alias_name]}"
done

# Clean welcome
echo ""
echo "Terminal ready. Welcome back, $(whoami)."
echo ""
