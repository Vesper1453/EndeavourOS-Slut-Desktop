#!/bin/bash

# 💦💋 HORNY BASH PROMPT - SENSUAL VIBES 💕🌹
# Add to ~/.bashrc: source ~/.config/slutterminal/bash-horny.sh

# Colors
HORNY_DARK='\[\033[38;5;232m\]'
HORNY_ROSE='\[\033[38;5;204m\]'
HORNY_PINK='\[\033[38;5;211m\]'
HORNY_CORAL='\[\033[38;5;210m\]'
HORNY_RED='\[\033[38;5;203m\]'
HORNY_PURPLE='\[\033[38;5;176m\]'
RESET='\[\033[0m\]'

# Sexy symbols
HEART='💖'
ROSE='🌹'
PEACH='🍑'
LIPS='💋'
WINE='🍷'

# Function to show git branch
git_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo " $HORNY_ROSE($HEART $branch $HEART)$RESET"
    fi
}

# Function to show if last command failed
last_status() {
    local status=$?
    if [ $status -ne 0 ]; then
        echo " $HORNY_RED✗$RESET"
    else
        echo " $HORNY_PINK✓$RESET"
    fi
}

# Build the prompt
build_prompt() {
    # Mode indicator
    local mode="${HORNY_ROSE}$HEART${HORNY_PINK}HORNY${HORNY_ROSE}$HEART${RESET}"
    
    # Username
    local user="${HORNY_CORAL}${LIPS} \u ${LIPS}${RESET}"
    
    # Host
    local host="${HORNY_PURPLE}${ROSE} \h ${ROSE}${RESET}"
    
    # Path
    local path="${HORNY_PINK}${PEACH} \w ${PEACH}${RESET}"
    
    # Git branch
    local git=$(git_branch)
    
    # Status
    local status=$(last_status)
    
    # Combine
    PS1="\n${mode}\n${user}${HORNY_ROSE}@${RESET}${host}\n${path}${git}${status}\n${HORNY_PINK}╰─➤ ${RESET}"
}

# Set the prompt
PROMPT_COMMAND='build_prompt'

# Title bar
case "$TERM" in
    xterm*|rxvt*|konsole*|kitty*|alacritty*)
        PS1="\[\e]0;🌹💋 \u@\h 💋🌹\a\]$PS1"
        ;;
esac

# Alias section - sensual, not explicit
declare -A HORNY_ALIASES=(
    ["love"]="firefox https://xvideos.com"
    ["desire"]="firefox https://chaturbate.com"
    ["romance"]="firefox https://xhamster.com"
    ["rose"]="echo '🌹🌹🌹' | lolcat"
    ["sexy"]="neofetch | lolcat"
    ["mood"]="cmatrix -C red"
    ["tease"]="echo '💋 Coming soon... 💋' | lolcat"
    ["flirt"]="fortune -s | cowsay -f kiss | lolcat"
)

for alias_name in "${!HORNY_ALIASES[@]}"; do
    alias "$alias_name"="${HORNY_ALIASES[$alias_name]}"
done

# Flirty welcome
echo ""
echo "🌹 Welcome to Horny Mode 💋" | lolcat
echo "💕 Feeling flirty today? 💕" | lolcat
echo ""
