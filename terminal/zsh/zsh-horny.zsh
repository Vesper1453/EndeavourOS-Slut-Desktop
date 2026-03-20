#!/bin/zsh

# 💦💋 HORNY ZSH CONFIG - SENSUAL VIBES 💕🌹
# Source this in ~/.zshrc: source ~/.config/slutterminal/zsh/zsh-horny.zsh

# Load required modules
autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit
setopt promptsubst

# ============================================
# 🎨 HORNY COLORS (Rose/Coral)
# ============================================
HORNY_ROSE='%F{204}'
HORNY_PINK='%F{211}'
HORNY_GOLD='%F{220}'
HORNY_SOFT='%F{253}'
RESET='%f'

# ============================================
# 💋 FLIRTY PROMPT
# ============================================
# Format: ~ [💖 user@host 💕] ~/path
#         ➜ 

# Get current git branch (if in git repo)
git_branch() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo " ${HORNY_PINK}(${HORNY_SOFT}🌹 ${branch}${HORNY_PINK})${RESET}"
    fi
}

# Get exit status emoji
exit_status() {
    echo "%(?.${HORNY_ROSE}💖.${HORNY_ROSE}💔)"
}

# Build the prompt
PROMPT='${HORNY_PINK}~ ${HORNY_ROSE}[${HORNY_PINK}💖 %n ${HORNY_GOLD}💕 %m ${HORNY_ROSE}]${RESET}$(git_branch)
${HORNY_PINK}➜${RESET} '

# Right prompt shows time
RPROMPT='${HORNY_ROSE}[${HORNY_PINK}%*${HORNY_ROSE}]${RESET} $(exit_status)'

# ============================================
# 💕 SENSUAL ALIASES
# ============================================

# Basic navigation
alias home='cd ~ && echo "🏠 Welcome home, sweetie..."'
alias lovely='echo "🌹 You look lovely today!"'
alias sweet='echo "💖 So sweet and innocent..."'

# LS with warm colors
alias ls='ls --color=auto -F'
alias la='ls -la --color=auto'
alias ll='ls -lh --color=auto'
alias l='ls -CF --color=auto'

# Grep with colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Warm system info
alias pretty='neofetch --ascii_distro arch | lolcat'
alias tease='~/kde-mode-switcher.sh horny && echo "💋 Just a little tease..."'
alias romance='~/kde-mode-switcher.sh horny && echo "🌹 Getting in the mood..."'

# Quick shortcuts (less explicit than degenerate)
alias browse='firefox &'
alias video='cd ~/Videos && echo "🎬 Your video collection..."'
alias pics='cd ~/Pictures && echo "📸 Beautiful memories..."'

# Transparency control
alias sheer='~/transparency-hotkeys.sh light'
alias veil='~/transparency-hotkeys.sh medium'
alias covered='~/transparency-hotkeys.sh opaque'

# Colorful output
alias cat='bat --style=plain --paging=never 2>/dev/null || cat'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# Sweet fortune
alias fortune='fortune -a | cowsay -f stegosaurus | lolcat'

# ============================================
# 🌹 FUNCTIONS
# ============================================

# Please - polite sudo
please() {
    echo "🌹 Pretty please with sugar on top..."
    sudo "$@"
}

# Flirt - prints flirty message
flirt() {
    local messages=(
        "💖 You're absolutely stunning!"
        "🌹 I'd pick you every time..."
        "💕 You make my heart flutter!"
        "💋 *blows a kiss*"
        "🥰 You're such a cutie!"
        "✨ Absolutely gorgeous!"
        "🦋 You give me butterflies!"
        "💫 Star of my show!"
    )
    echo "${messages[$RANDOM % ${#messages[@]}]}"
}

# Search (romantic themes)
romancesearch() {
    local query="$*"
    query=${query// /+}
    firefox "https://youtube.com/results?search_query=romantic+$query" &
}

# Quick transparency
sheer() {
    ~/transparency-hotkeys.sh 25
    echo "👗 A sheer glimpse... so alluring!"
}

private() {
    ~/transparency-hotkeys.sh 0
    echo "🔒 Keeping it private... for now"
}

# ============================================
# 🎨 LS COLORS (WARM ROSES/PINKS)
# ============================================
export LS_COLORS='di=1;38;5;204:ln=1;38;5;211:so=38;5;220:pi=38;5;209:ex=1;38;5;82:bd=38;5;211:cd=38;5;211:su=38;5;209:sg=38;5;209:tw=38;5;204:ow=38;5;204:*.mp4=38;5;204:*.mkv=38;5;204:*.avi=38;5;204:*.mov=38;5;204:*.webm=38;5;204:*.jpg=38;5;211:*.jpeg=38;5;211:*.png=38;5;211:*.gif=38;5;211:*.zip=38;5;220:*.tar=38;5;220:*.gz=38;5;220:*.bz2=38;5;220:*.7z=38;5;220:*.mp3=38;5;211:*.flac=38;5;211:*.ogg=38;5;211:*.pdf=38;5;209:*.doc=38;5;209:*.docx=38;5;209:*.txt=38;5;253:*.sh=1;38;5;82:*.zsh=1;38;5;82:*.py=1;38;5;82:*.js=1;38;5;82:*.html=38;5;204:*.css=38;5;211:'

# ============================================
# 💕 KEY BINDINGS
# ============================================

# Ctrl+T for light transparency
bindkey -s '^T' 'sheer\n'

# Ctrl+P for private
bindkey -s '^P' 'private\n'

# Ctrl+F for flirt
bindkey -s '^F' 'flirt\n'

# ============================================
# 💋 COMPLETION SETTINGS
# ============================================
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' verbose true

# ============================================
# 🌹 HISTORY SETTINGS
# ============================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# ==========================================
# 💕 WELCOME MESSAGE
# ==========================================
clear
echo ""
echo "    💖 Welcome back, beautiful! 💕"
echo ""
flirt 2>/dev/null || echo "🌹 Ready for something sweet?"
echo ""
