#!/bin/zsh

# ✨ NORMAL ZSH PROMPT - CLEAN & PROFESSIONAL 🖥️
# Source from ~/.zshrc: source ~/.config/slutterminal/zsh-normal.zsh

# Load colors
autoload -U colors && colors
setopt promptsubst

# Colors
normal_gray='%F{245}'
normal_blue='%F{75}'
normal_green='%F{82}'
normal_yellow='%F{226}'
normal_red='%F{196}'
reset='%f'

# Symbols
gear='⚙️'
user_icon='👤'
pc_icon='💻'
folder='📁'
check='✓'
cross='✗'

# Git info
git_info() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
        echo " ${normal_blue}(${branch})${reset}"
    fi
}

# Exit status
exit_status() {
    echo "%(?.${normal_green}${check}.${normal_red}${cross})${reset}"
}

# Left prompt - clean, no mode indicator
PROMPT=''
PROMPT+='${normal_blue}${user_icon} %n${reset}'
PROMPT+='${normal_gray}@%m${reset} '
PROMPT+='${normal_yellow}${folder} %~${reset}'
PROMPT+='$(git_info) '
PROMPT+='$(exit_status) '
PROMPT+='${normal_blue}\$ ${reset}'

# Right prompt - time
RPROMPT='${normal_gray}%D{%H:%M}${reset}'

# Terminal title
case "$TERM" in
    xterm*|rxvt*|konsole*|kitty*|alacritty*)
        precmd() { print -Pn "\e]0;%n@%m\a" }
        ;;
esac

# Clean aliases
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

for alias_name in ${(k)NORMAL_ALIASES}; do
    alias $alias_name="${NORMAL_ALIASES[$alias_name]}"
done

# Clean welcome
echo ""
echo "Terminal ready. Welcome back, $(whoami)."
echo ""
