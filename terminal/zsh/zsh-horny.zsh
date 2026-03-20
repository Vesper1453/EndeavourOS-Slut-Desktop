#!/bin/zsh

# 💦💋 HORNY ZSH PROMPT - SENSUAL VIBES 💕🌹
# Source from ~/.zshrc: source ~/.config/slutterminal/zsh-horny.zsh

# Load colors
autoload -U colors && colors
setopt promptsubst

# Colors
horny_dark='%F{232}'
horny_rose='%F{204}'
horny_pink='%F{211}'
horny_coral='%F{210}'
horny_red='%F{203}'
horny_purple='%F{176}'
reset='%f'

# Symbols
heart='💖'
rose='🌹'
peach='🍑'
lips='💋'
wine='🍷'

# Git info
git_info() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
        echo " ${horny_rose}(${heart} ${branch} ${heart})${reset}"
    fi
}

# Exit status
exit_status() {
    echo "%(?.${horny_pink}✓.${horny_red}✗)${reset}"
}

# Left prompt
PROMPT=''
PROMPT+='${horny_rose}${heart}${horny_pink}HORNY${horny_rose}${heart}${reset}'$'\n'
PROMPT+='${horny_coral}${lips} %n ${lips}${reset}'
PROMPT+='${horny_rose}@%m${reset} '
PROMPT+='${horny_pink}${peach} %~ ${peach}${reset}'
PROMPT+='$(git_info) '
PROMPT+='$(exit_status)'$'\n'
PROMPT+='${horny_pink}╰─➤ ${reset}'

# Right prompt - time with hearts
RPROMPT='${horny_purple}${heart} %D{%H:%M} ${heart}${reset}'

# Terminal title
case "$TERM" in
    xterm*|rxvt*|konsole*|kitty*|alacritty*)
        precmd() { print -Pn "\e]0;🌹💋 %n@%m 💋🌹\a" }
        ;;
esac

# Aliases - sensual
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

for alias_name in ${(k)HORNY_ALIASES}; do
    alias $alias_name="${HORNY_ALIASES[$alias_name]}"
done

# Flirty welcome
echo ""
echo "🌹 Welcome to Horny Mode 💋"
echo "💕 Feeling flirty today? 💕"
echo ""
