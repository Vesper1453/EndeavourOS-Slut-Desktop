#!/bin/zsh

# ✨ NORMAL ZSH CONFIG - CLEAN & PROFESSIONAL 🖥️
# Source this in ~/.zshrc: source ~/.config/slutterminal/zsh/zsh-normal.zsh

# Load required modules
autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit
setopt promptsubst

# ============================================
# 🎨 NORMAL COLORS (Clean Grays/Blues)
# ============================================
NORMAL_GRAY='%F{245}'
NORMAL_BLUE='%F{75}'
NORMAL_CYAN='%F{87}'
NORMAL_WHITE='%F{255}'
RESET='%f'

# ============================================
# 🖥️ PROFESSIONAL PROMPT
# ============================================
# Format: [user@host] ~/path
#         $ 

# Get current git branch (if in git repo)
git_branch() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo " ${NORMAL_GRAY}(${NORMAL_BLUE}git:${branch}${NORMAL_GRAY})${RESET}"
    fi
}

# Get exit status
exit_status() {
    echo "%(?.${NORMAL_BLUE}✓.${NORMAL_GRAY}✗)"
}

# Build the prompt
PROMPT='${NORMAL_GRAY}[${NORMAL_BLUE}%n${NORMAL_GRAY}@${NORMAL_BLUE}%m${NORMAL_GRAY}]${RESET}$(git_branch) ${NORMAL_BLUE}%~${RESET}
${NORMAL_GRAY}$${RESET} '

# Right prompt shows time
RPROMPT='${NORMAL_GRAY}[${NORMAL_BLUE}%*${NORMAL_GRAY}]${RESET} $(exit_status)'

# ============================================
# 🖥️ STANDARD ALIASES
# ============================================

# Basic navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'

# LS with colors
alias ls='ls --color=auto -F'
alias la='ls -la --color=auto'
alias ll='ls -lh --color=auto'
alias l='ls -CF --color=auto'

# Grep with colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# System info
alias sysinfo='neofetch'
alias clean='~/kde-mode-switcher.sh normal && echo "Clean mode activated"'

# Quick shortcuts
alias ff='firefox &'
alias doc='cd ~/Documents'
alias down='cd ~/Downloads'

# Standard output
alias cat='bat --style=plain --paging=never 2>/dev/null || cat'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# ============================================
# 🖥️ FUNCTIONS
# ============================================

# Sudo with confirmation
sudo() {
    echo "Executing with elevated privileges..."
    command sudo "$@"
}

# Professional greeting
greeting() {
    local hour=$(date +%H)
    if [ $hour -lt 12 ]; then
        echo "Good morning!"
    elif [ $hour -lt 18 ]; then
        echo "Good afternoon!"
    else
        echo "Good evening!"
    fi
}

# ============================================
# 🎨 LS COLORS (STANDARD)
# ============================================
export LS_COLORS='di=1;34:ln=1;36:so=33:pi=33:ex=1;32:bd=33:cd=33:su=31:sg=31:tw=34:ow=34:*.mp4=35:*.mkv=35:*.avi=35:*.mov=35:*.webm=35:*.jpg=35:*.jpeg=35:*.png=35:*.gif=35:*.zip=31:*.tar=31:*.gz=31:*.bz2=31:*.7z=31:*.mp3=35:*.flac=35:*.ogg=35:*.pdf=33:*.doc=33:*.docx=33:*.txt=37:*.sh=1;32:*.zsh=1;32:*.py=1;32:*.js=1;32:*.html=34:*.css=36:'

# ============================================
# 🖥️ COMPLETION SETTINGS
# ============================================
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' verbose true

# ============================================
# 🖥️ HISTORY SETTINGS
# ============================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# ==========================================
# 🖥️ WELCOME MESSAGE
# ==========================================
clear
greeting 2>/dev/null || echo "Welcome!"
