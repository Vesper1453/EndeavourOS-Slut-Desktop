#!/bin/zsh

# 💦💋 HORNY MODE ZSH PROMPT - SENSUAL VIBES 💕🌹
# Add this to your ~/.zshrc for a flirty zsh experience

# Load required modules
autoload -U colors && colors
autoload -U promptinit && promptinit
setopt promptsubst

# Horny colors
horny_dark='%F{232}'       # Dark
horny_rose='%F{204}'       # Rose
horny_pink='%F{211}'       # Pink
horny_coral='%F{210}'      # Coral
horny_red='%F{197}'        # Red
horny_white='%F{255}'      # White
horny_reset='%f'           # Reset

# Sexy symbols
HORNY_ARROW=$'❯'
HORNY_BRANCH=$'◈'

# Git info for prompt
horny_git_info() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
        local git_status=$(git status --porcelain 2>/dev/null)
        local color=$horny_white
        if [[ -n $git_status ]]; then
            color=$horny_red
        fi
        echo " ${horny_rose}(${horny_coral}💋${color}${branch}${horny_rose})${horny_reset}"
    fi
}

# Build the horny prompt
horny_build_prompt() {
    local EXIT_CODE=$?
    
    # Time in white
    local time_part="${horny_white}[%D{%H:%M:%S}]${horny_reset}"
    
    # User in coral with rose
    local user_part="${horny_coral}🌹%n${horny_reset}"
    
    # Host in rose
    local host_part="${horny_rose}@%m${horny_reset}"
    
    # Directory in pink
    local dir_part="${horny_pink}%~${horny_reset}"
    
    # Git info
    local git_part=$(horny_git_info)
    
    # Exit code indicator
    local exit_part=""
    if [ $EXIT_CODE -ne 0 ]; then
        exit_part=" ${horny_red}🔥${EXIT_CODE}🔥${horny_reset}"
    fi
    
    # Build prompt
    echo "${time_part} ${user_part}${host_part}:${dir_part}${git_part}${exit_part}"
}

# Set the prompt
PROMPT='$(horny_build_prompt)
${horny_coral}💋${horny_rose}${HORNY_ARROW}${horny_reset} '

# Right prompt - sexy status
RPROMPT='${horny_rose}💖${horny_reset}'

# Window title
title() {
    print -Pn "\e]0;💋💦 HORNY MODE - %~\a"
}
precmd_functions+=(title)

# Horny aliases
alias ls='ls --color=auto -F'
alias ll='ls -lahF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# LS_COLORS with pink/rose tones
export LS_COLORS='rs=0:di=01;95:ln=01;93:mh=00:pi=40;33:so=01;95:do=01;95:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;91:*.tar=01;95:*.tgz=01;95:*.arc=01;95:*.arj=01;95:*.taz=01;95:*.lha=01;95:*.lz4=01;95:*.lzh=01;95:*.lzma=01;95:*.tlz=01;95:*.txz=01;95:*.tzo=01;95:*.t7z=01;95:*.zip=01;95:*.z=01;95:*.dz=01;95:*.gz=01;95:*.lrz=01;95:*.lz=01;95:*.lzo=01;95:*.xz=01;95:*.zst=01;95:*.tzst=01;95:*.bz2=01;95:*.bz=01;95:*.tbz=01;95:*.tbz2=01;95:*.tz=01;95:*.deb=01;95:*.rpm=01;95:*.jar=01;95:*.war=01;95:*.ear=01;95:*.sar=01;95:*.rar=01;95:*.alz=01;95:*.ace=01;95:*.zoo=01;95:*.cpio=01;95:*.7z=01;95:*.rz=01;95:*.cab=01;95:*.wim=01;95:*.swm=01;95:*.dwm=01;95:*.esd=01;95:*.jpg=01;95:*.jpeg=01;95:*.mjpg=01;95:*.mjpeg=01;95:*.gif=01;95:*.bmp=01;95:*.pbm=01;95:*.pgm=01;95:*.ppm=01;95:*.tga=01;95:*.xbm=01;95:*.xpm=01;95:*.tif=01;95:*.tiff=01;95:*.png=01;95:*.svg=01;95:*.svgz=01:95:*.mng=01;95:*.pcx=01;95:*.mov=01;95:*.mpg=01;95:*.mpeg=01;95:*.m2v=01;95:*.mkv=01;95:*.webm=01;95:*.ogm=01;95:*.mp4=01;95:*.m4v=01;95:*.mp4v=01;95:*.vob=01;95:*.qt=01;95:*.nuv=01;95:*.wmv=01;95:*.asf=01;95:*.rm=01;95:*.rmvb=01;95:*.flc=01;95:*.avi=01;95:*.fli=01;95:*.flv=01;95:*.gl=01;95:*.dl=01;95:*.xcf=01;95:*.xwd=01;95:*.yuv=01;95:*.cgm=01;95:*.emf=01;95:*.ogv=01;95:*.ogx=01;95:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
