#!/bin/zsh

# 🍆💦 DEGENERATE ZSH PROMPT - MAXIMUM FILTH 💋🔥
# Source from ~/.zshrc: source ~/.config/slutterminal/zsh-degenerate.zsh

# Load colors
autoload -U colors && colors
setopt promptsubst

# Colors
degen_bg='%F{232}'      # Deep purple-black
degen_deep_pink='%F{197}'
degen_hot_pink='%F{205}'
degen_purple='%F{93}'
degen_red='%F{196}'
degen_magenta='%F{201}'
reset='%f'

# Symbols
cum_drop='💦'
peach='🍑'
eggplant='🍆'
lips='💋'
fire='🔥'

# Git info
git_info() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
        echo " ${degen_hot_pink}(${lips} ${branch} ${lips})${reset}"
    fi
}

# Exit status
exit_status() {
    echo "%(?.${degen_hot_pink}✓.${degen_red}✗)${reset}"
}

# Left prompt
PROMPT=''
PROMPT+='${degen_red}${fire}${degen_hot_pink}DEGENERATE${degen_red}${fire}${reset}'$'\n'
PROMPT+='${degen_magenta}${cum_drop} %n ${cum_drop}${reset}'
PROMPT+='${degen_purple}@%m${reset} '
PROMPT+='${degen_deep_pink}${peach} %~ ${peach}${reset}'
PROMPT+='$(git_info) '
PROMPT+='$(exit_status)'$'\n'
PROMPT+='${degen_hot_pink}╰─➤ ${reset}'

# Right prompt - time with cum drops
RPROMPT='${degen_purple}${cum_drop} %D{%H:%M} ${cum_drop}${reset}'

# Terminal title
case "$TERM" in
    xterm*|rxvt*|konsole*|kitty*|alacritty*)
        precmd() { print -Pn "\e]0;🍆💦 %n@%m 💦🍆\a" }
        ;;
esac

# Aliases - explicit
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

for alias_name in ${(k)DEGEN_ALIASES}; do
    alias $alias_name="${DEGEN_ALIASES[$alias_name]}"
done

# Fortune on startup
echo ""
fortune -s 2>/dev/null | cowsay -f sodomized 2>/dev/null | lolcat 2>/dev/null || echo "🍆 Welcome to Degenerate Mode 💦"
echo ""
