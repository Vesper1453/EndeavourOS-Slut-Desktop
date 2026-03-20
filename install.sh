#!/bin/bash

# 🍆💦 ENDEAVOUROS SLUT DESKTOP - ONE-CLICK INSTALLER 💋🔥
# For EndeavourOS and Arch Linux ONLY - No Debian/Tails support!

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
PINK='\033[38;5;205m'
HOT_PINK='\033[38;5;198m'
RED='\033[38;5;196m'
PURPLE='\033[38;5;93m'
GREEN='\033[38;5;82m'
YELLOW='\033[38;5;220m'
RESET='\033[0m'

# ===== CHECK IF ENDEAVOUROS/ARCH =====
check_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
    else
        echo -e "${RED}❌ Cannot detect Linux distribution${RESET}"
        exit 1
    fi
    
    # Only allow Arch-based distros
    if [[ "$DISTRO" != "arch" ]] && [[ "$DISTRO" != "endeavouros" ]]; then
        echo -e "${RED}❌ ERROR: This installer is for EndeavourOS/Arch Linux ONLY!${RESET}"
        echo -e "${RED}   Your distro: $DISTRO${RESET}"
        echo ""
        echo -e "${YELLOW}💡 For Tails or Debian, use the legacy branch:${RESET}"
        echo -e "${YELLOW}   git clone -b debian https://github.com/Vesper1453/TailsSlutDesktop.git${RESET}"
        exit 1
    fi
    
    if [[ "$DISTRO" == "endeavouros" ]]; then
        echo -e "${PINK}🚀 EndeavourOS detected! Perfect for maximum depravity...${RESET}"
    else
        echo -e "${PINK}🏹 Arch Linux detected! Let's get slutty...${RESET}"
    fi
}

# ===== TERMINAL DETECTION =====
detect_terminal() {
    if command -v konsole &> /dev/null; then
        TERMINAL="konsole"
        TERMINAL_CMD="konsole -e"
        echo -e "${PINK}💋 Konsole detected (KDE)!${RESET}"
    elif command -v kitty &> /dev/null; then
        TERMINAL="kitty"
        TERMINAL_CMD="kitty -e"
        echo -e "${PINK}💋 Kitty terminal detected!${RESET}"
    elif command -v alacritty &> /dev/null; then
        TERMINAL="alacritty"
        TERMINAL_CMD="alacritty -e"
        echo -e "${PINK}💋 Alacritty detected!${RESET}"
    elif command -v gnome-terminal &> /dev/null; then
        TERMINAL="gnome-terminal"
        TERMINAL_CMD="gnome-terminal -- bash -c"
        echo -e "${YELLOW}⚠️  GNOME Terminal detected - installing Kitty instead${RESET}"
    else
        TERMINAL="xterm"
        TERMINAL_CMD="xterm -e"
        echo -e "${YELLOW}⚠️  No good terminal found - will install Kitty${RESET}"
    fi
}

# Detect at start
check_distro
detect_terminal

echo -e "${PURPLE}"
cat << 'EOF'
╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║     🍆💦  ENDEAVOUROS SLUT DESKTOP INSTALLER  💋🔥            ║
║                                                                ║
║              For EndeavourOS & Arch Linux ONLY                ║
║                                                                ║
║     The most depraved Linux desktop experience ever...        ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
EOF
echo -e "${RESET}"

# Menu
show_menu() {
    echo -e "${HOT_PINK}Select installation option:${RESET}"
    echo ""
    echo "  1) 🔥 FULL INSTALL (i3 + terminal + all packages + adult sites)"
    echo "  2) 🖥️  i3 Window Manager + all slutty features"
    echo "  3) 📟 Terminal Customization only"
    echo "  4) 📦 Install packages only"
    echo "  5) 🚨 Install Panic Button only"
    echo "  6) 🎬 Install Terminal Video Viewer only"
    echo "  7) 🍆 Create Adult Sites Shortcuts only"
    echo "  8) 📋 Show package list"
    echo "  9) ❌ Exit"
    echo ""
    read -p "Enter choice [1-9]: " choice
    
    case $choice in
        1) full_install ;;
        2) install_i3 ;;
        3) install_terminal ;;
        4) install_packages ;;
        5) install_panic_button ;;
        6) install_video_viewer ;;
        7) create_adult_shortcuts ;;
        8) show_packages ;;
        9) exit 0 ;;
        *) echo -e "${RED}Invalid choice${RESET}"; show_menu ;;
    esac
}

full_install() {
    echo -e "${RED}🔥 FULL ENDEAVOUROS SLUT INSTALLATION...${RESET}"
    install_packages
    install_i3
    install_terminal
    install_panic_button
    install_video_viewer
    create_adult_shortcuts
    
    echo ""
    echo -e "${GREEN}"
    cat << 'EOF'
╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║     ✅ ENDEAVOUROS SLUT DESKTOP FULLY INSTALLED! ✅          ║
║                                                                ║
║     Your system is now ready for maximum depravity!            ║
║                                                                ║
║     Mode Hotkeys:                                              ║
║       Alt+F1  = 🔥 Degenerate Mode (explicit AF)             ║
║       Alt+F2  = 💦 Horny Mode (sensual & flirty)              ║
║       Alt+F3  = ✨ Normal Mode (clean for mom visits)         ║
║                                                                ║
║     Emergency:                                                 ║
║       Mod+Shift+Delete = 🚨 PANIC BUTTON                     ║
║                                                                ║
║     17 adult site shortcuts on your Desktop!                   ║
║                                                                ║
║     Reboot and select i3 from the login menu!                  ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${RESET}"
}

install_packages() {
    echo -e "${HOT_PINK}📦 Installing EndeavourOS packages...${RESET}"
    
    # Update pacman database
    echo -e "${PINK}💋 Updating package database...${RESET}"
    sudo pacman -Sy
    
    # Core packages
    echo -e "${PINK}💋 Installing core packages...${RESET}"
    sudo pacman -S --needed --noconfirm \
        i3-wm i3status i3lock dmenu \
        i3-gaps \
        picom nitrogen kitty rofi polybar \
        dunst lxappearance \
        ffmpeg mpv \
        libcaca libsixel \
        zsh zsh-completions \
        feh imagemagick \
        ranger thunar dolphin \
        htop btop \
        conky neofetch cmatrix \
        fortune-mod cowsay lolcat \
        wmctrl xdotool xclip \
        git curl wget \
        noto-fonts noto-fonts-emoji \
        ttf-nerd-fonts-symbols-mono \
        ttf-font-awesome \
        firefox chromium \
        2>/dev/null || {
        echo -e "${RED}⚠️  Some packages may have failed${RESET}"
    }
    
    # Install yay if not present
    if ! command -v yay &> /dev/null; then
        echo -e "${HOT_PINK}💋 Installing yay AUR helper...${RESET}"
        sudo pacman -S --needed --noconfirm git base-devel
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        cd /tmp/yay && makepkg -si --noconfirm
        cd -
    fi
    
    # Install AUR packages
    echo -e "${HOT_PINK}💋 Installing AUR packages...${RESET}"
    yay -S --needed --noconfirm \
        cava \
        2>/dev/null || true
    
    echo -e "${GREEN}✅ Packages installed!${RESET}"
}

install_i3() {
    echo -e "${HOT_PINK}🖥️  Setting up i3 Window Manager...${RESET}"
    
    # Create directories
    mkdir -p ~/.config/i3
    mkdir -p ~/.config/i3/scripts
    mkdir -p ~/.config/picom
    mkdir -p ~/.config/dunst
    mkdir -p ~/.config/rofi
    
    # Copy i3 configs
    cp "$SCRIPT_DIR/i3/config-degenerate" ~/.config/i3/config-degenerate
    cp "$SCRIPT_DIR/i3/config-horny" ~/.config/i3/config-horny
    cp "$SCRIPT_DIR/i3/config-normal" ~/.config/i3/config-normal
    
    # Copy switch-mode script
    cp "$SCRIPT_DIR/i3/scripts/switch-mode" ~/.config/i3/scripts/switch-mode
    chmod +x ~/.config/i3/scripts/switch-mode
    
    # Copy picom configs
    cp "$SCRIPT_DIR/picom/picom-degenerate.conf" ~/.config/picom/
    cp "$SCRIPT_DIR/picom/picom-horny.conf" ~/.config/picom/
    
    # Copy dunst configs if they exist
    if [ -f "$SCRIPT_DIR/dunst/dunst-degenerate.conf" ]; then
        cp "$SCRIPT_DIR/dunst"/*.conf ~/.config/dunst/ 2>/dev/null || true
    fi
    
    # Copy rofi themes if they exist
    if [ -d "$SCRIPT_DIR/rofi" ]; then
        cp "$SCRIPT_DIR/rofi"/*.rasi ~/.config/rofi/ 2>/dev/null || true
    fi
    
    # Set default to normal
    cp ~/.config/i3/config-normal ~/.config/i3/config
    
    echo -e "${GREEN}✅ i3 configured!${RESET}"
    echo -e "${PINK}   Logout and select 'i3' from the login menu${RESET}"
}

install_terminal() {
    echo -e "${PURPLE}📟 Installing Terminal Customizations...${RESET}"
    
    # Create directories
    mkdir -p ~/.config/slutterminal
    mkdir -p ~/.config/kitty
    mkdir -p ~/.config/kitty/scripts
    mkdir -p ~/.local/share/konsole
    
    # Install Kitty configs
    if [ -d "$SCRIPT_DIR/terminal/kitty" ]; then
        echo -e "${PINK}💋 Installing Kitty configs...${RESET}"
        cp "$SCRIPT_DIR/terminal/kitty"/*.conf ~/.config/kitty/
        cp "$SCRIPT_DIR/terminal/scripts/terminal-switcher.sh" ~/.config/kitty/scripts/switch-mode
        chmod +x ~/.config/kitty/scripts/switch-mode
        cp ~/.config/kitty/kitty-normal.conf ~/.config/kitty/kitty.conf
    fi
    
    # Install Konsole color schemes
    if [ -d "$SCRIPT_DIR/terminal/konsole" ]; then
        echo -e "${PINK}💋 Installing Konsole color schemes...${RESET}"
        cp "$SCRIPT_DIR/terminal/konsole"/*.colorscheme ~/.local/share/konsole/
    fi
    
    # Install Bash prompts
    if [ -d "$SCRIPT_DIR/terminal/bash" ]; then
        echo -e "${PINK}💋 Installing Bash prompts...${RESET}"
        cp "$SCRIPT_DIR/terminal/bash"/*.sh ~/.config/slutterminal/
        cp ~/.config/slutterminal/bash-normal.sh ~/.config/slutterminal/bash-current.sh
        
        # Add to .bashrc
        if ! grep -q "slutterminal/bash-current.sh" ~/.bashrc 2>/dev/null; then
            echo "" >> ~/.bashrc
            echo "# 🍆💦 Slutty Terminal Prompt 💋🔥" >> ~/.bashrc
            echo "source ~/.config/slutterminal/bash-current.sh" >> ~/.bashrc
        fi
    fi
    
    # Install Zsh prompts
    if [ -d "$SCRIPT_DIR/terminal/zsh" ]; then
        echo -e "${PINK}💋 Installing Zsh prompts...${RESET}"
        cp "$SCRIPT_DIR/terminal/zsh"/*.zsh ~/.config/slutterminal/
        cp ~/.config/slutterminal/zsh-normal.zsh ~/.config/slutterminal/zsh-current.zsh
        
        # Add to .zshrc
        if [ -f ~/.zshrc ] && ! grep -q "slutterminal/zsh-current.zsh" ~/.zshrc 2>/dev/null; then
            echo "" >> ~/.zshrc
            echo "# 🍆💦 Slutty Terminal Prompt 💋🔥" >> ~/.zshrc
            echo "source ~/.config/slutterminal/zsh-current.zsh" >> ~/.zshrc
        fi
    fi
    
    # Copy terminal switcher to home
    cp "$SCRIPT_DIR/terminal/scripts/terminal-switcher.sh" ~/terminal-switcher.sh
    chmod +x ~/terminal-switcher.sh
    
    echo -e "${GREEN}✅ Terminal customized!${RESET}"
    echo -e "${PINK}   Switch modes: ~/terminal-switcher.sh [degenerate|horny|normal]${RESET}"
}

install_panic_button() {
    echo -e "${RED}🚨 Installing Panic Button...${RESET}"
    
    mkdir -p ~/.config/i3/scripts
    cp "$SCRIPT_DIR/scripts/panic-button.sh" ~/.config/i3/scripts/panic-button
    chmod +x ~/.config/i3/scripts/panic-button
    cp "$SCRIPT_DIR/scripts/panic-button.sh" ~/panic-button.sh
    chmod +x ~/panic-button.sh
    
    # Create desktop shortcut
    echo "[Desktop Entry]" > ~/Desktop/🚨-PANIC-BUTTON.desktop
    echo "Name=🚨 PANIC BUTTON" >> ~/Desktop/🚨-PANIC-BUTTON.desktop
    echo "Comment=Emergency wipe - hides all evidence" >> ~/Desktop/🚨-PANIC-BUTTON.desktop
    echo "Exec=$TERMINAL_CMD ~/.config/i3/scripts/panic-button" >> ~/Desktop/🚨-PANIC-BUTTON.desktop
    echo "Type=Application" >> ~/Desktop/🚨-PANIC-BUTTON.desktop
    echo "Terminal=false" >> ~/Desktop/🚨-PANIC-BUTTON.desktop
    echo "Icon=dialog-error" >> ~/Desktop/🚨-PANIC-BUTTON.desktop
    chmod +x ~/Desktop/🚨-PANIC-BUTTON.desktop
    
    echo -e "${GREEN}✅ Panic button installed!${RESET}"
}

install_video_viewer() {
    echo -e "${HOT_PINK}🎬 Installing Terminal Video Viewer...${RESET}"
    
    cp "$SCRIPT_DIR/scripts/terminal-video-viewer.sh" ~/terminal-video.sh
    chmod +x ~/terminal-video.sh
    mkdir -p ~/.local/bin
    ln -sf ~/terminal-video.sh ~/.local/bin/terminal-video 2>/dev/null || true
    
    echo "[Desktop Entry]" > ~/Desktop/🎬-Terminal-Video.desktop
    echo "Name=🎬 Terminal Video" >> ~/Desktop/🎬-Terminal-Video.desktop
    echo "Comment=Watch videos in terminal (ASCII/Sixel)" >> ~/Desktop/🎬-Terminal-Video.desktop
    echo "Exec=$TERMINAL_CMD ~/terminal-video.sh --help" >> ~/Desktop/🎬-Terminal-Video.desktop
    echo "Type=Application" >> ~/Desktop/🎬-Terminal-Video.desktop
    echo "Terminal=false" >> ~/Desktop/🎬-Terminal-Video.desktop
    echo "Icon=video-x-generic" >> ~/Desktop/🎬-Terminal-Video.desktop
    chmod +x ~/Desktop/🎬-Terminal-Video.desktop
    
    echo -e "${GREEN}✅ Video viewer installed!${RESET}"
}

show_packages() {
    cat "$SCRIPT_DIR/PACKAGES.md"
}

create_adult_shortcuts() {
    echo -e "${RED}🍆💦 Creating Adult Site Shortcuts... 💋🔥${RESET}"
    
    mkdir -p ~/Desktop
    
    # Mainstream Porn
    create_shortcut "🔞-Pornhub" "https://pornhub.com"
    create_shortcut "🔞-Xvideos" "https://xvideos.com"
    create_shortcut "🔞-Xnxx" "https://xnxx.com"
    create_shortcut "🔞-Redtube" "https://redtube.com"
    create_shortcut "🔞-Youporn" "https://youporn.com"
    create_shortcut "🔞-Tube8" "https://tube8.com"
    create_shortcut "🔞-Spankbang" "https://spankbang.com"
    create_shortcut "🔞-xHamster" "https://xhamster.com"
    
    # Cam Sites
    create_shortcut "🎥-Chaturbate" "https://chaturbate.com"
    create_shortcut "🎥-CamSoda" "https://camsoda.com"
    create_shortcut "🎥-Stripchat" "https://stripchat.com"
    create_shortcut "🎥-BongaCams" "https://bongacams.com"
    create_shortcut "🎥-MyFreeCams" "https://myfreecams.com"
    create_shortcut "🎥-JerkMate" "https://jerkmate.com"
    
    # Hentai
    create_shortcut "🦊-HentaiHaven" "https://hentaihaven.org"
    create_shortcut "🦊-Rule34" "https://rule34.xxx"
    
    echo -e "${GREEN}✅ 17 adult site shortcuts created!${RESET}"
}

create_shortcut() {
    local name=$1
    local url=$2
    
    echo "[Desktop Entry]" > ~/Desktop/${name}.desktop
    echo "Name=${name}" >> ~/Desktop/${name}.desktop
    echo "Comment=Launch ${name}" >> ~/Desktop/${name}.desktop
    echo "Exec=firefox ${url}" >> ~/Desktop/${name}.desktop
    echo "Type=Application" >> ~/Desktop/${name}.desktop
    echo "Terminal=false" >> ~/Desktop/${name}.desktop
    echo "Icon=firefox" >> ~/Desktop/${name}.desktop
    chmod +x ~/Desktop/${name}.desktop
}

# Command line arguments
if [ -n "$1" ]; then
    case "$1" in
        --full) full_install ;;
        --i3) install_i3 ;;
        --terminal) install_terminal ;;
        --packages) install_packages ;;
        --panic) install_panic_button ;;
        --video) install_video_viewer ;;
        --adult) create_adult_shortcuts ;;
        *) show_menu ;;
    esac
else
    show_menu
fi