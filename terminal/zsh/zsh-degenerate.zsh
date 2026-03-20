#!/bin/zsh

# 🍆💦 DEGENERATE ZSH CONFIG - MAXIMUM FILTH 💋🔥
# Source this in ~/.zshrc: source ~/.config/slutterminal/zsh/zsh-degenerate.zsh

# Load required modules
autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit
setopt promptsubst

# ============================================
# 🎨 DEGENERATE COLORS
# ============================================
DEGEN_PINK='%F{198}'
DEGEN_HOT_PINK='%F{205}'
DEGEN_RED='%F{196}'
DEGEN_DARK='%F{235}'
DEGEN_CREAM='%F{255}'
RESET='%f'

# ============================================
# 🍆 SLUTTY PROMPT
# ============================================
# Format: [🍆 user@host 💦] ~/path
#         └─> 

# Get current git branch (if in git repo)
git_branch() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo " ${DEGEN_HOT_PINK}(${DEGEN_CREAM} ${branch}${DEGEN_HOT_PINK})${RESET}"
    fi
}

# Get exit status emoji
exit_status() {
    echo "%(?.${DEGEN_PINK}💦.${DEGEN_RED}🚫)"
}

# Build the prompt
PROMPT='${DEGEN_DARK}┌─${DEGEN_HOT_PINK}[${DEGEN_PINK}🍆 %n ${DEGEN_CREAM}💦 %m ${DEGEN_HOT_PINK}]${RESET}$(git_branch)
${DEGEN_DARK}└─${DEGEN_HOT_PINK}>${RESET} '

# Right prompt shows time
RPROMPT='${DEGEN_HOT_PINK}[${DEGEN_PINK}%*${DEGEN_HOT_PINK}]${RESET} $(exit_status)'

# ============================================
# 💋 SLUTTY ALIASES
# ============================================

# Basic navigation
alias porn='cd ~/Videos && echo "🍆 Going to your porn stash..."'
alias fap='echo "💦 Happy fapping, slut!" && clear'
alias cum='echo "🥵 C-C-C-CUMMING!!" && figlet "CUM" | lolcat'

# LS with slutty colors
alias ls='ls --color=auto -F'
alias la='ls -la --color=auto'
alias ll='ls -lh --color=auto'
alias l='ls -CF --color=auto'

# Grep with colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Slutty system info
alias slutinfo='neofetch --ascii_distro arch | lolcat'
alias degenerate='~/kde-mode-switcher.sh degenerate && echo "🔥 Welcome to Degenerate Mode, you filthy slut!"'
alias horny='~/kde-mode-switcher.sh horny && echo "💦 Getting you wet and ready..."'
alias normal='~/kde-mode-switcher.sh normal && echo "✨ Back to being a good boy/girl..."'

# Quick porn shortcuts
alias ph='firefox https://pornhub.com &'
alias xv='firefox https://xvideos.com &'
alias xn='firefox https://xnxx.com &'
alias sb='firefox https://spankbang.com &'
alias hh='firefox https://hentaihaven.org &'
alias r34='firefox https://rule34.xxx &'

# Panic button
alias panic='~/.config/i3/scripts/panic-button 2>/dev/null || ~/panic-button.sh'

# Transparency control
alias transparent='~/transparency-hotkeys.sh'
alias ghost='~/transparency-hotkeys.sh ghost'
alias see='~/transparency-hotkeys.sh medium'

# Colorful output
alias cat='bat --style=plain --paging=never 2>/dev/null || cat'
alias df='df -h | lolcat'
alias du='du -h | lolcat'
alias free='free -h | lolcat'

# Slutty fortune
alias fortune='fortune -a | cowsay -f blowfish | lolcat'

# ============================================
# 🔥 FUNCTIONS
# ============================================

# Fuck - repeats last command with sudo
fuck() {
    echo "🍆 Fuck it, doing it anyway with sudo..."
    sudo $(fc -ln -1)
}

# Slut mode - prints random slutty message
slut() {
    local messages=(
        "💋 You're such a dirty slut!"
        "🍆 Take it all, whore!"
        "💦 Make me wet, baby..."
        "🔥 You're my filthy little cumslut!"
        "🥵 Fuck me harder!"
        "👅 Lick it all up!"
        "💖 Spread those cheeks!"
        "🌹 Daddy's little whore!"
    )
    echo "${messages[$RANDOM % ${#messages[@]}]}"
}

# Porn search
pornsearch() {
    local query="$*"
    query=${query// /+}
    firefox "https://pornhub.com/video/search?search=$query" &
}

# Quick transparency
ghostmode() {
    ~/transparency-hotkeys.sh ghost
    echo "👻 You're basically invisible now, slut!"
}

opaque() {
    ~/transparency-hotkeys.sh opaque
    echo "🔒 Back to solid - no peeking!"
}

# Cmatrix with slutty colors
slutmatrix() {
    cmatrix -C magenta -b -u 2
}

# Random porn wallpaper
de_generate() {
    nitrogen --set-zoom-fill ~/wallpapers/degenerate_wallpaper.jpg
    ~/kde-mode-switcher.sh degenerate
    echo "🔥 FULL DEGENERATE MODE ACTIVATED! 🍆💦"
}

# ============================================
# 🎨 LS COLORS (DEGENERATE PINK/PURPLE)
# ============================================
export LS_COLORS='di=1;38;5;205:ln=1;38;5;198:so=38;5;93:pi=38;5;196:ex=1;38;5;82:bd=38;5;93:cd=38;5;93:su=38;5;196:sg=38;5;196:tw=38;5;205:ow=38;5;205:*.mp4=38;5;205:*.mkv=38;5;205:*.avi=38;5;205:*.mov=38;5;205:*.webm=38;5;205:*.jpg=38;5;198:*.jpeg=38;5;198:*.png=38;5;198:*.gif=38;5;198:*.zip=38;5;93:*.tar=38;5;93:*.gz=38;5;93:*.bz2=38;5;93:*.7z=38;5;93:*.mp3=38;5;198:*.flac=38;5;198:*.ogg=38;5;198:*.pdf=38;5;196:*.doc=38;5;196:*.docx=38;5;196:*.txt=38;5;255:*.sh=1;38;5;82:*.zsh=1;38;5;82:*.py=1;38;5;82:*.js=1;38;5;82:*.html=38;5;205:*.css=38;5;198:'

# ============================================
# 🍆 KEY BINDINGS
# ============================================
# Use bindkey for ZLE (Zsh Line Editor)

# Ctrl+T for transparent toggle
bindkey -s '^T' 'transparent 75\n'

# Ctrl+G for ghost mode
bindkey -s '^G' 'ghostmode\n'

# Ctrl+P for porn folder
bindkey -s '^P' 'porn\n'

# Ctrl+D for degenerate mode
bindkey -s '^D' 'degenerate\n'

# ============================================
# 💋 COMPLETION SETTINGS
# ============================================
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' verbose true

# ============================================
# 🔥 HISTORY SETTINGS
# ============================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# ==========================================
# 🥵 WELCOME MESSAGE
# ==========================================
clear
neofetch --ascii_distro arch 2>/dev/null | lolcat 2>/dev/null || echo "🍆💦 Welcome back, slut! 💋🔥"
echo ""
slut 2>/dev/null || echo "💋 Ready to get filthy?"
echo ""
