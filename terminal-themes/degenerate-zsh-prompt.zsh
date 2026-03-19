#!/bin/zsh

# 🍆💦 DEGENERATE MODE ZSH PROMPT - MAXIMUM FILTH 💋🔥
# Add this to your ~/.zshrc for a cum-stained zsh experience

# Load required modules
autoload -U colors && colors
autoload -U promptinit && promptinit
setopt promptsubst

# Degenerate colors
degen_bg='%F{232}'      # Deep black
degen_deep_pink='%F{197}'  # Deep pink
degen_hot_pink='%F{205}'   # Hot pink
degen_purple='%F{93}'      # Purple
degen_red='%F{196}'        # Red
degen_cum_white='%F{255}'  # Cum white
degen_reset='%f'           # Reset

# Slutty powerline symbols (using standard symbols that work in most fonts)
DEGEN_ARROW=$'▶'
DEGEN_BRANCH=$'◈'

# Git info for prompt
degen_git_info() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
        local git_status=$(git status --porcelain 2>/dev/null)
        local color=$degen_cum_white
        if [[ -n $git_status ]]; then
            color=$degen_red
        fi
        echo " ${degen_deep_pink}(${degen_hot_pink}🔥${color}${branch}${degen_deep_pink})${degen_reset}"
    fi
}

# Build the degenerate prompt
degen_build_prompt() {
    local EXIT_CODE=$?
    
    # Time in cum-white
    local time_part="${degen_cum_white}[%D{%H:%M:%S}]${degen_reset}"
    
    # User in hot pink with fire
    local user_part="${degen_hot_pink}🔥%n${degen_reset}"
    
    # Host in deep pink
    local host_part="${degen_deep_pink}@%m${degen_reset}"
    
    # Directory in purple
    local dir_part="${degen_purple}%~${degen_reset}"
    
    # Git info
    local git_part=$(degen_git_info)
    
    # Exit code indicator
    local exit_part=""
    if [ $EXIT_CODE -ne 0 ]; then
        exit_part=" ${degen_red}🔥${EXIT_CODE}🔥${degen_reset}"
    fi
    
    # Build prompt
    echo "${time_part} ${user_part}${host_part}:${dir_part}${git_part}${exit_part}"
}

# Set the prompt
PROMPT='$(degen_build_prompt)
${degen_hot_pink}💦${degen_deep_pink}${DEGEN_ARROW}${degen_reset} '

# Right prompt - slutty status
RPROMPT='${degen_deep_pink}🍆${degen_reset}'

# Window title
title() {
    print -Pn "\e]0;🍆💦 DEGENERATE MODE - %~\a"
}
precmd_functions+=(title)

# Degenerate aliases
alias ls='ls --color=auto -F'
alias ll='ls -lahF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# LS_COLORS with pink/purple tones
export LS_COLORS='rs=0:di=01;95:ln=01;93:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;91:*.tar=01;96:*.tgz=01;96:*.arc=01;96:*.arj=01;96:*.taz=01;96:*.lha=01;96:*.lz4=01;96:*.lzh=01;96:*.lzma=01;96:*.tlz=01;96:*.txz=01;96:*.tzo=01;96:*.t7z=01;96:*.zip=01;96:*.z=01;96:*.dz=01;96:*.gz=01;96:*.lrz=01;96:*.lz=01;96:*.lzo=01;96:*.xz=01;96:*.zst=01;96:*.tzst=01;96:*.bz2=01;96:*.bz=01;96:*.tbz=01;96:*.tbz2=01;96:*.tz=01;96:*.deb=01;96:*.rpm=01;96:*.jar=01;96:*.war=01;96:*.ear=01;96:*.sar=01;96:*.rar=01;96:*.alz=01;96:*.ace=01;96:*.zoo=01;96:*.cpio=01;96:*.7z=01;96:*.rz=01;96:*.cab=01;96:*.wim=01;96:*.swm=01;96:*.dwm=01;96:*.esd=01;96:*.jpg=01;95:*.jpeg=01;95:*.mjpg=01;95:*.mjpeg=01;95:*.gif=01;95:*.bmp=01;95:*.pbm=01;95:*.pgm=01;95:*.ppm=01;95:*.tga=01;95:*.xbm=01;95:*.xpm=01;95:*.tif=01;95:*.tiff=01;95:*.png=01;95:*.svg=01;95:*.svgz=01;95:*.mng=01;95:*.pcx=01;95:*.mov=01;95:*.mpg=01;95:*.mpeg=01;95:*.m2v=01;95:*.mkv=01;95:*.webm=01;95:*.ogm=01;95:*.mp4=01;95:*.m4v=01;95:*.mp4v=01;95:*.vob=01;95:*.qt=01;95:*.nuv=01;95:*.wmv=01;95:*.asf=01;95:*.rm=01;95:*.rmvb=01;95:*.flc=01;95:*.avi=01;95:*.fli=01;95:*.flv=01;95:*.gl=01;95:*.dl=01;95:*.xcf=01;95:*.xwd=01;95:*.yuv=01;95:*.cgm=01;95:*.emf=01;95:*.ogv=01;95:*.ogx=01;95:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
