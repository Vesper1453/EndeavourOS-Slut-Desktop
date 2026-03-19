#!/bin/bash

# 🍆💦 DEGENERATE MODE BASH PROMPT - MAXIMUM FILTH 💋🔥
# Add this to your ~/.bashrc for a cum-stained terminal experience

# Colors - Degenerate palette
DEGEN_BLACK='\[\033[38;5;232m\]'
DEGEN_DEEP_PINK='\[\033[38;5;197m\]'
DEGEN_HOT_PINK='\[\033[38;5;205m\]'
DEGEN_PURPLE='\[\033[38;5;93m\]'
DEGEN_RED='\[\033[38;5;196m\]'
DEGEN_CUM_WHITE='\[\033[38;5;255m\]'
DEGEN_RESET='\[\033[0m\]'

# Slutty symbols
PUSSY='🍑'
EGGPLANT='🍆'
SPLASH='💦'
FIRE='🔥'
LIPS='💋'
TONGUE='👅'
PEACH='🍑'
DROOL='🤤'

# Degenerate prompt function
degenerate_prompt() {
    local EXIT_CODE=$?
    
    # Current time in cum-white
    local TIME="${DEGEN_CUM_WHITE}[\t]${DEGEN_RESET}"
    
    # Username in hot pink with fire
    local USER="${DEGEN_HOT_PINK}${FIRE}\u${DEGEN_RESET}"
    
    # Hostname in deep pink
    local HOST="${DEGEN_DEEP_PINK}@\h${DEGEN_RESET}"
    
    # Working directory in purple
    local DIR="${DEGEN_PURPLE}\w${DEGEN_RESET}"
    
    # Git branch (if in git repo) in cum white
    local GIT_BRANCH=""
    if git rev-parse --git-dir > /dev/null 2>&1; then
        local BRANCH=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
        local GIT_COLOR="${DEGEN_CUM_WHITE}"
        if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
            GIT_COLOR="${DEGEN_RED}"
        fi
        GIT_BRANCH=" ${DEGEN_DEEP_PINK}(${EGGPLANT}${GIT_COLOR}${BRANCH}${DEGEN_DEEP_PINK})${DEGEN_RESET}"
    fi
    
    # Exit code indicator
    local EXIT_STATUS=""
    if [ $EXIT_CODE -ne 0 ]; then
        EXIT_STATUS=" ${DEGEN_RED}${FIRE}${EXIT_CODE}${FIRE}${DEGEN_RESET}"
    fi
    
    # Build the slutty prompt
    PS1="${TIME} ${USER}${HOST}:${DIR}${GIT_BRANCH}${EXIT_STATUS}\n${DEGEN_HOT_PINK}${SPLASH}${DEGEN_DEEP_PINK}▶${DEGEN_RESET} "
    
    # Window title
    PS1="\[\e]0;🍆💦 DEGENERATE MODE - \w\a\]${PS1}"
}

# Set the prompt
PROMPT_COMMAND='degenerate_prompt'

# Degenerate aliases for maximum filth
alias ls='ls --color=auto -F'
alias ll='ls -lahF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

# Colorful file types for degenerate viewing
export LS_COLORS='rs=0:di=01;95:ln=01;93:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;91:*.tar=01;96:*.tgz=01;96:*.arc=01;96:*.arj=01;96:*.taz=01;96:*.lha=01;96:*.lz4=01;96:*.lzh=01;96:*.lzma=01;96:*.tlz=01;96:*.txz=01;96:*.tzo=01;96:*.t7z=01;96:*.zip=01;96:*.z=01;96:*.dz=01;96:*.gz=01;96:*.lrz=01;96:*.lz=01;96:*.lzo=01;96:*.xz=01;96:*.zst=01;96:*.tzst=01;96:*.bz2=01;96:*.bz=01;96:*.tbz=01;96:*.tbz2=01;96:*.tz=01;96:*.deb=01;96:*.rpm=01;96:*.jar=01;96:*.war=01;96:*.ear=01;96:*.sar=01;96:*.rar=01;96:*.alz=01;96:*.ace=01;96:*.zoo=01;96:*.cpio=01;96:*.7z=01;96:*.rz=01;96:*.cab=01;96:*.wim=01;96:*.swm=01;96:*.dwm=01;96:*.esd=01;96:*.jpg=01;95:*.jpeg=01;95:*.mjpg=01;95:*.mjpeg=01;95:*.gif=01;95:*.bmp=01;95:*.pbm=01;95:*.pgm=01;95:*.ppm=01;95:*.tga=01;95:*.xbm=01;95:*.xpm=01;95:*.tif=01;95:*.tiff=01;95:*.png=01;95:*.svg=01;95:*.svgz=01;95:*.mng=01;95:*.pcx=01;95:*.mov=01;95:*.mpg=01;95:*.mpeg=01;95:*.m2v=01;95:*.mkv=01;95:*.webm=01;95:*.ogm=01;95:*.mp4=01;95:*.m4v=01;95:*.mp4v=01;95:*.vob=01;95:*.qt=01;95:*.nuv=01;95:*.wmv=01;95:*.asf=01;95:*.rm=01;95:*.rmvb=01;95:*.flc=01;95:*.avi=01;95:*.fli=01;95:*.flv=01;95:*.gl=01;95:*.dl=01;95:*.xcf=01;95:*.xwd=01;95:*.yuv=01;95:*.cgm=01;95:*.emf=01;95:*.ogv=01;95:*.ogx=01;95:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
