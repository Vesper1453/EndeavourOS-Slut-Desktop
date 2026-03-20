#!/bin/bash

# 🍆💦 ENDEAVOUROS SLUT DESKTOP - KDE EDITION 💋🔥
# Customizes KDE Plasma with three depraved modes!
# For EndeavourOS / Arch Linux ONLY

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
PINK='\033[38;5;205m'
HOT_PINK='\033[38;5;198m'
RED='\033[38;5;196m'
PURPLE='\033[38;5;93m'
GREEN='\033[38;5;82m'
RESET='\033[0m'

# ===== DISTRO CHECK =====
check_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
    fi
    
    if [[ "$DISTRO" != "endeavouros" ]] && [[ "$DISTRO" != "arch" ]] && [[ "$DISTRO" != "manjaro" ]]; then
        echo -e "${RED}❌ ERROR: This installer is for EndeavourOS/Arch Linux ONLY!${RESET}"
        echo -e "${RED}   Detected: $DISTRO${RESET}"
        exit 1
    fi
    
    echo -e "${GREEN}✅ EndeavourOS/Arch detected! Let's get slutty! 💋${RESET}"
}

check_distro

echo -e "${PURPLE}"
cat << 'EOF'
╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║     🍆💦  ENDEAVOUROS SLUT DESKTOP - KDE EDITION  💋🔥        ║
║                                                                ║
║     The most depraved KDE Plasma experience ever...           ║
║                                                                ║
║     💻 Stays in KDE - No window manager switching!              ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
EOF
echo -e "${RESET}"

# Menu
show_menu() {
    echo -e "${HOT_PINK}Select installation option:${RESET}"
    echo ""
    echo "  1) 🔥 FULL KDE CUSTOMIZATION (colors + terminal + wallpapers + shortcuts)"
    echo "  2) 🎨 KDE Color Schemes + Plasma Theme only"
    echo "  3) 📟 Terminal Customization only (Konsole themes)"
    echo "  4) 🖼️  Wallpapers + Desktop Settings only"
    echo "  5) 🚨 Install Panic Button only"
    echo "  6) 🎬 Install Terminal Video Viewer only"
    echo "  7) 🍆 Create Adult Sites Shortcuts only"
    echo "  8) 🔄 Switch to Mode (Degenerate/Horny/Normal)"
    echo "  9) ❌ Exit"
    echo ""
    read -p "Enter choice [1-9]: " choice
    
    case $choice in
        1) full_install ;;
        2) install_kde_themes ;;
        3) install_terminal ;;
        4) install_wallpapers ;;
        5) install_panic_button ;;
        6) install_video_viewer ;;
        7) create_adult_shortcuts ;;
        8) switch_kde_mode ;;
        9) exit 0 ;;
        *) echo -e "${RED}Invalid choice${RESET}"; show_menu ;;
    esac
}

# Detect terminal
TERMINAL_CMD=""
detect_terminal() {
    if command -v konsole &> /dev/null; then
        TERMINAL_CMD="konsole"
    elif command -v kitty &> /dev/null; then
        TERMINAL_CMD="kitty"
    elif command -v gnome-terminal &> /dev/null; then
        TERMINAL_CMD="gnome-terminal"
    elif command -v alacritty &> /dev/null; then
        TERMINAL_CMD="alacritty"
    else
        TERMINAL_CMD="xterm"
    fi
    echo -e "${PINK}💋 Detected terminal: $TERMINAL_CMD${RESET}"
}

full_install() {
    echo -e "${RED}🔥 FULL KDE SLUTIFICATION STARTING...${RESET}"
    detect_terminal
    install_packages
    install_kde_themes
    install_terminal
    install_wallpapers
    install_panic_button
    install_video_viewer
    create_adult_shortcuts
    
    echo ""
    echo -e "${GREEN}"
    cat << 'EOF'
╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║           ✅ FULL KDE INSTALLATION COMPLETE! ✅               ║
║                                                                ║
║     Your slutty KDE Plasma desktop is ready!                  ║
║                                                                ║
║     Hotkeys:                                                   ║
║       Alt+F1  = 🔥 Degenerate Mode                             ║
║       Alt+F2  = 💦 Horny Mode                                  ║
║       Alt+F3  = ✨ Normal Mode                                 ║
║       Meta+Shift+Delete = 🚨 PANIC BUTTON                     ║
║                                                                ║
║     Run: ~/kde-mode-switcher.sh degenerate                    ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${RESET}"
    
    echo -e "${HOT_PINK}💋 You may need to log out and back in for all changes to apply!${RESET}"
}

install_packages() {
    echo -e "${HOT_PINK}📦 Installing all slutty packages...${RESET}"
    
    sudo pacman -Sy
    
    # Core KDE + customization packages
    sudo pacman -S --needed --noconfirm \
        plasma-workspace \
        plasma-desktop \
        konsole \
        dolphin \
        spectacle \
        plasma-pa \
        plasma-nm \
        kdeplasma-addons \
        plasma-firewall \
        kwin \
        kscreen \
        kwallet \
        kwalletmanager \
        qt5-graphicaleffects \
        qt5-quickcontrols2 \
        qt5-multimedia \
        nitrogen \
        picom \
        feh \
        ffmpeg \
        mpv \
        vlc \
        chafa \
        libcaca \
        zsh \
        zsh-completions \
        zsh-syntax-highlighting \
        zsh-autosuggestions \
        oh-my-zsh-git \
        powerlevel10k \
        lolcat \
        fortune-mod \
        cowsay \
        cmatrix \
        neofetch \
        htop \
        btop \
        wmctrl \
        xdotool \
        xclip \
        xorg-xrandr \
        xorg-xprop \
        imagemagick \
        noto-fonts \
        noto-fonts-emoji \
        ttf-nerd-fonts-symbols-mono \
        ttf-font-awesome \
        ttf-jetbrains-mono \
        2>/dev/null || {
        echo -e "${RED}⚠️  Some packages may have failed to install${RESET}"
    }
    
    # Check for AUR helper
    if command -v yay &> /dev/null; then
        echo -e "${HOT_PINK}💋 Installing extra AUR packages with yay...${RESET}"
        yay -S --needed --noconfirm \
            cava \
            plasma-applet-caffeine-plus \
            2>/dev/null || true
    fi
    
    echo -e "${GREEN}✅ Packages installed!${RESET}"
}

install_kde_themes() {
    echo -e "${HOT_PINK}🎨 Installing KDE Plasma color schemes...${RESET}"
    
    # Create KDE directories
    mkdir -p ~/.local/share/color-schemes
    mkdir -p ~/.local/share/plasma/desktoptheme
    mkdir -p ~/.config/kcminput
    mkdir -p ~/.config/kcmfonts
    
    # Copy color schemes
    cp "$SCRIPT_DIR/kde/colors/DegenerateSlut.colors" ~/.local/share/color-schemes/
    cp "$SCRIPT_DIR/kde/colors/HornySlut.colors" ~/.local/share/color-schemes/
    cp "$SCRIPT_DIR/kde/colors/NormalClean.colors" ~/.local/share/color-schemes/
    
    # Install wallpapers
    cp "$SCRIPT_DIR/wallpapers/degenerate_wallpaper.jpg" ~/Pictures/
    cp "$SCRIPT_DIR/wallpapers/horny_wallpaper.jpg" ~/Pictures/
    
    # Create mode switcher script for KDE
    cp "$SCRIPT_DIR/kde/scripts/kde-mode-switcher.sh" ~/kde-mode-switcher.sh
    chmod +x ~/kde-mode-switcher.sh
    
    # Create desktop shortcuts for mode switching
    mkdir -p ~/Desktop
    
    # Degenerate Mode shortcut
    cat > ~/Desktop/🔥-DEGENERATE-MODE.desktop << EOF
[Desktop Entry]
Name=🔥 DEGENERATE MODE
Comment=Maximum filth mode - explicit wallpapers, cum-stained colors
Exec=$HOME/kde-mode-switcher.sh degenerate
Icon=applications-graphics
Type=Application
Terminal=false
Categories=System;
EOF
    chmod +x ~/Desktop/🔥-DEGENERATE-MODE.desktop
    
    # Horny Mode shortcut
    cat > ~/Desktop/💦-HORNY-MODE.desktop << EOF
[Desktop Entry]
Name=💦 HORNY MODE
Comment=Flirty mode - rose/coral sensual vibes
Exec=$HOME/kde-mode-switcher.sh horny
Icon=applications-graphics
Type=Application
Terminal=false
Categories=System;
EOF
    chmod +x ~/Desktop/💦-HORNY-MODE.desktop
    
    # Normal Mode shortcut
    cat > ~/Desktop/✨-NORMAL-MODE.desktop << EOF
[Desktop Entry]
Name=✨ NORMAL MODE
Comment=Clean mode - standard KDE look
Exec=$HOME/kde-mode-switcher.sh normal
Icon=applications-graphics
Type=Application
Terminal=false
Categories=System;
EOF
    chmod +x ~/Desktop/✨-NORMAL-MODE.desktop
    
    # Create KDE global shortcuts
    mkdir -p ~/.config/kglobalshortcutsrc
    
    echo -e "${GREEN}✅ KDE themes installed!${RESET}"
    echo -e "${PINK}   Use mode shortcuts on desktop or run: ~/kde-mode-switcher.sh <mode>${RESET}"
}

install_terminal() {
    echo -e "${HOT_PINK}📟 Installing terminal customization...${RESET}"
    
    # Install for Konsole (KDE's default)
    mkdir -p ~/.local/share/konsole
    
    # Copy Konsole color schemes
    cp "$SCRIPT_DIR/terminal/konsole/DegenerateSlut.colorscheme" ~/.local/share/konsole/ 2>/dev/null || true
    cp "$SCRIPT_DIR/terminal/konsole/HornySlut.colorscheme" ~/.local/share/konsole/ 2>/dev/null || true
    cp "$SCRIPT_DIR/terminal/konsole/NormalClean.colorscheme" ~/.local/share/konsole/ 2>/dev/null || true
    
    # Create Konsole profile with slutty settings
    mkdir -p ~/.config/konsolerc
    
    # Install bash configs
    mkdir -p ~/.config/slutterminal/bash
    cp "$SCRIPT_DIR/terminal/bash/bash-degenerate.sh" ~/.config/slutterminal/bash/
    cp "$SCRIPT_DIR/terminal/bash/bash-horny.sh" ~/.config/slutterminal/bash/
    cp "$SCRIPT_DIR/terminal/bash/bash-normal.sh" ~/.config/slutterminal/bash/
    
    # Install zsh configs
    mkdir -p ~/.config/slutterminal/zsh
    cp "$SCRIPT_DIR/terminal/zsh/zsh-degenerate.zsh" ~/.config/slutterminal/zsh/
    cp "$SCRIPT_DIR/terminal/zsh/zsh-horny.zsh" ~/.config/slutterminal/zsh/
    cp "$SCRIPT_DIR/terminal/zsh/zsh-normal.zsh" ~/.config/slutterminal/zsh/
    
    # Install terminal switcher
    cp "$SCRIPT_DIR/terminal/scripts/terminal-switcher.sh" ~/terminal-switcher.sh
    chmod +x ~/terminal-switcher.sh
    
    # Add to shell rc files if not already present
    if ! grep -q "slutterminal" ~/.bashrc 2>/dev/null; then
        echo "" >> ~/.bashrc
        echo "# 🍆💦 Slut Terminal Config 💋🔥" >> ~/.bashrc
        echo "source ~/.config/slutterminal/bash/bash-degenerate.sh" >> ~/.bashrc
    fi
    
    if [ -f ~/.zshrc ] && ! grep -q "slutterminal" ~/.zshrc 2>/dev/null; then
        echo "" >> ~/.zshrc
        echo "# 🍆💦 Slut Terminal Config 💋🔥" >> ~/.zshrc
        echo "source ~/.config/slutterminal/zsh/zsh-degenerate.zsh" >> ~/.zshrc
    fi
    
    echo -e "${GREEN}✅ Terminal customization installed!${RESET}"
    echo -e "${PINK}   Run: ~/terminal-switcher.sh <mode> to switch${RESET}"
}

install_wallpapers() {
    echo -e "${HOT_PINK}🖼️  Installing wallpapers...${RESET}"
    
    mkdir -p ~/Pictures/Wallpapers
    
    cp "$SCRIPT_DIR/wallpapers/degenerate_wallpaper.jpg" ~/Pictures/Wallpapers/
    cp "$SCRIPT_DIR/wallpapers/horny_wallpaper.jpg" ~/Pictures/Wallpapers/
    
    # Set default wallpaper (will apply after mode switch)
    echo -e "${GREEN}✅ Wallpapers installed to ~/Pictures/Wallpapers/${RESET}"
}

install_panic_button() {
    echo -e "${RED}🚨 Installing Panic Button...${RESET}"
    
    # Create panic button script
    cat > ~/.local/bin/slut-panic << 'EOF'
#!/bin/bash
# 🚨 PANIC BUTTON - EMERGENCY WIPE 🚨

# Kill all browsers
pkill -9 firefox 2>/dev/null || true
pkill -9 chromium 2>/dev/null || true
pkill -9 brave 2>/dev/null || true
pkill -9 tor-browser 2>/dev/null || true

# Clear browser data
rm -rf ~/.cache/mozilla/firefox/*/cache2/* 2>/dev/null || true
rm -rf ~/.cache/chromium/* 2>/dev/null || true

# Hide adult shortcuts
mkdir -p ~/.hidden_adult_icons
mv ~/Desktop/*Porn*.desktop ~/.hidden_adult_icons/ 2>/dev/null || true
mv ~/Desktop/*Xvideos*.desktop ~/.hidden_adult_icons/ 2>/dev/null || true
mv ~/Desktop/*Spankbang*.desktop ~/.hidden_adult_icons/ 2>/dev/null || true
mv ~/Desktop/*Hentai*.desktop ~/.hidden_adult_icons/ 2>/dev/null || true

# Clear recent files
rm -rf ~/.local/share/RecentDocuments/* 2>/dev/null || true

# Clear bash history
history -c 2>/dev/null || true
rm -f ~/.bash_history 2>/dev/null || true

# Switch to Normal mode
~/kde-mode-switcher.sh normal

# Show notification
kdialog --title "🚨 PANIC BUTTON ACTIVATED" --msgbox "All evidence hidden! Desktop switched to Normal mode."
EOF
    
    chmod +x ~/.local/bin/slut-panic
    
    # Create desktop shortcut
    cat > ~/Desktop/🚨-PANIC-BUTTON.desktop << 'EOF'
[Desktop Entry]
Name=🚨 PANIC BUTTON
Comment=Emergency wipe - hides all evidence instantly
Exec=~/.local/bin/slut-panic
Icon=dialog-error
Type=Application
Terminal=false
Categories=System;Security;
EOF
    chmod +x ~/Desktop/🚨-PANIC-BUTTON.desktop
    
    # Add KDE global shortcut for panic button (Meta+Shift+Delete)
    kwriteconfig5 --file kglobalshortcutsrc --group kwin --key "SlutPanic" "Meta+Shift+Delete,Meta+Shift+Delete,Activate Slut Panic"
    
    echo -e "${GREEN}✅ Panic button installed!${RESET}"
    echo -e "${PINK}   Desktop: 🚨-PANIC-BUTTON.desktop${RESET}"
    echo -e "${PINK}   Hotkey: Meta+Shift+Delete${RESET}"
}

install_video_viewer() {
    echo -e "${HOT_PINK}🎬 Installing Terminal Video Viewer...${RESET}"
    
    # Create the video viewer script
    cat > ~/.local/bin/terminal-porn << 'EOF'
#!/bin/bash
# 🍆💦 TERMINAL VIDEO VIEWER 💋🔥

VIDEO="$1"

if [ -z "$VIDEO" ]; then
    echo "Usage: terminal-porn <video-file>"
    echo ""
    echo "Watches video in terminal using ASCII art!"
    exit 1
fi

# Check which viewer is available
if command -v mpv &> /dev/null; then
    # Use mpv with libcaca for terminal output
    mpv --vo=caca "$VIDEO"
elif command -v cacaview &> /dev/null; then
    # Fallback to cacaview
    cacaview "$VIDEO"
else
    echo "❌ No terminal video player found!"
    echo "Install: sudo pacman -S mpv libcaca"
    exit 1
fi
EOF
    
    chmod +x ~/.local/bin/terminal-porn
    
    echo -e "${GREEN}✅ Terminal video viewer installed!${RESET}"
    echo -e "${PINK}   Usage: terminal-porn <video.mp4>${RESET}"
}

create_adult_shortcuts() {
    echo -e "${HOT_PINK}🍆 Creating Adult Sites Shortcuts...${RESET}"
    
    mkdir -p ~/Desktop
    
    # Mainstream Porn Sites
    cat > ~/Desktop/🍆-Pornhub.desktop << EOF
[Desktop Entry]
Name=🍆 Pornhub
Comment=Mainstream adult content
Exec=firefox https://pornhub.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/🍆-Pornhub.desktop

    cat > ~/Desktop/💦-Xvideos.desktop << EOF
[Desktop Entry]
Name=💦 Xvideos
Comment=Adult video streaming
Exec=firefox https://xvideos.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/💦-Xvideos.desktop

    cat > ~/Desktop/🔥-Xnxx.desktop << EOF
[Desktop Entry]
Name=🔥 Xnxx
Comment=Adult video platform
Exec=firefox https://xnxx.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/🔥-Xnxx.desktop

    cat > ~/Desktop/🍑-Redtube.desktop << EOF
[Desktop Entry]
Name=🍑 Redtube
Comment=Adult content
Exec=firefox https://redtube.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/🍑-Redtube.desktop

    cat > ~/Desktop/👅-Youporn.desktop << EOF
[Desktop Entry]
Name=👅 Youporn
Comment=Adult video site
Exec=firefox https://youporn.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/👅-Youporn.desktop

    cat > ~/Desktop/🌸-Tube8.desktop << EOF
[Desktop Entry]
Name=🌸 Tube8
Comment=Video tube site
Exec=firefox https://tube8.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/🌸-Tube8.desktop

    cat > ~/Desktop/💋-Spankbang.desktop << EOF
[Desktop Entry]
Name=💋 Spankbang
Comment=Spanking content
Exec=firefox https://spankbang.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/💋-Spankbang.desktop

    cat > ~/Desktop/🐹-XHamster.desktop << EOF
[Desktop Entry]
Name=🐹 XHamster
Comment=Adult tube site
Exec=firefox https://xhamster.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/🐹-XHamster.desktop

    # Cam/OnlyFans Sites
    cat > ~/Desktop/📹-Chaturbate.desktop << EOF
[Desktop Entry]
Name=📹 Chaturbate
Comment=Live cam shows
Exec=firefox https://chaturbate.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/📹-Chaturbate.desktop

    cat > ~/Desktop/💻-CamSoda.desktop << EOF
[Desktop Entry]
Name=💻 CamSoda
Comment=Live cams
Exec=firefox https://camsoda.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/💻-CamSoda.desktop

    cat > ~/Desktop/🎥-Stripchat.desktop << EOF
[Desktop Entry]
Name=🎥 Stripchat
Comment=Live strip shows
Exec=firefox https://stripchat.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/🎥-Stripchat.desktop

    cat > ~/Desktop/💳-BongaCams.desktop << EOF
[Desktop Entry]
Name=💳 BongaCams
Comment=Live cam models
Exec=firefox https://bongacams.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/💳-BongaCams.desktop

    cat > ~/Desktop/🎀-MyFreeCams.desktop << EOF
[Desktop Entry]
Name=🎀 MyFreeCams
Comment=Free live cams
Exec=firefox https://myfreecams.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/🎀-MyFreeCams.desktop

    cat > ~/Desktop/🔞-JerkMate.desktop << EOF
[Desktop Entry]
Name=🔞 JerkMate
Comment=Interactive cams
Exec=firefox https://jerkmate.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/🔞-JerkMate.desktop

    # Hentai/Rule34 Sites
    cat > ~/Desktop/👾-HentaiHaven.desktop << EOF
[Desktop Entry]
Name=👾 Hentai Haven
Comment=Hentai streaming
Exec=firefox https://hentaihaven.org
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/👾-HentaiHaven.desktop

    cat > ~/Desktop/🦊-Rule34.desktop << EOF
[Desktop Entry]
Name=🦊 Rule34
Comment=Rule 34 content
Exec=firefox https://rule34.xxx
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/🦊-Rule34.desktop

    cat > ~/Desktop/🐺-E621.desktop << EOF
[Desktop Entry]
Name=🐺 E621
Comment=Furry content
Exec=firefox https://e621.net
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/🐺-E621.desktop

    cat > ~/Desktop/🎨-Gelbooru.desktop << EOF
[Desktop Entry]
Name=🎨 Gelbooru
Comment=Anime image board
Exec=firefox https://gelbooru.com
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/🎨-Gelbooru.desktop

    cat > ~/Desktop/📖-Danbooru.desktop << EOF
[Desktop Entry]
Name=📖 Danbooru
Comment=Anime art board
Exec=firefox https://danbooru.donmai.us
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/📖-Danbooru.desktop

    cat > ~/Desktop/🌟-EHentai.desktop << EOF
[Desktop Entry]
Name=🌟 E-Hentai
Comment=Hentai gallery
Exec=firefox https://e-hentai.org
Icon=applications-internet
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF
    chmod +x ~/Desktop/🌟-EHentai.desktop

    echo -e "${GREEN}✅ Created 17 adult site shortcuts on Desktop!${RESET}"
}

switch_kde_mode() {
    echo -e "${HOT_PINK}🔄 Switch KDE Mode...${RESET}"
    echo ""
    echo "  1) 🔥 DEGENERATE MODE (maximum filth)"
    echo "  2) 💦 HORNY MODE (sensual/flirty)"
    echo "  3) ✨ NORMAL MODE (clean/professional)"
    echo ""
    read -p "Select mode [1-3]: " mode_choice
    
    case $mode_choice in
        1) ~/kde-mode-switcher.sh degenerate ;;
        2) ~/kde-mode-switcher.sh horny ;;
        3) ~/kde-mode-switcher.sh normal ;;
        *) echo -e "${RED}Invalid choice${RESET}" ;;
    esac
}

# Detect terminal at start for desktop file creation
detect_terminal

# If running with arguments
if [ -n "$1" ]; then
    case "$1" in
        --full) full_install ;;
        --kde) install_kde_themes ;;
        --terminal) install_terminal ;;
        --wallpapers) install_wallpapers ;;
        --panic) install_panic_button ;;
        --video) install_video_viewer ;;
        --adult) create_adult_shortcuts ;;
        --mode) switch_kde_mode ;;
        *) show_menu ;;
    esac
else
    show_menu
fi
