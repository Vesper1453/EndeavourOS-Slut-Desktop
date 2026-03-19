#!/bin/bash

# 🍆💦 Tails Slut Desktop - Mode Switcher 🔥💋
# Switch between Degenerate, Horny, and Normal modes

set -e

MODE=$1
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

# Colors for terminal output
PINK='\033[38;5;205m'
HOT_PINK='\033[38;5;198m'
RED='\033[38;5;196m'
PURPLE='\033[38;5;93m'
RESET='\033[0m'

show_help() {
    echo -e "${HOT_PINK}🍆 Tails Slut Desktop - Mode Switcher 💦${RESET}"
    echo ""
    echo "Usage: ./mode-switcher.sh [MODE]"
    echo ""
    echo "Available Modes:"
    echo "  degenerate  - 🔥 Maximum filth, pornographic, explicit"
    echo "  horny       - 💦 Sensual, sexy, flirty"
    echo "  normal      - ✨ Clean, professional, standard"
    echo ""
    echo "Examples:"
    echo "  ./mode-switcher.sh degenerate  # Go full slut mode"
    echo "  ./mode-switcher.sh horny       # Sensual vibes"
    echo "  ./mode-switcher.sh normal      # Back to basics"
}

if [ -z "$MODE" ] || [ "$MODE" == "--help" ] || [ "$MODE" == "-h" ]; then
    show_help
    exit 0
fi

apply_degenerate_mode() {
    echo -e "${RED}🔥 ACTIVATING DEGENERATE MODE - MAXIMUM FILTH 🔥${RESET}"
    
    # Check if we're running i3
    if pgrep -x "i3" > /dev/null 2>&1; then
        echo -e "${HOT_PINK}💦 i3 detected - switching to degenerate i3 config...${RESET}"
        
        # Copy i3 config
        mkdir -p ~/.config/i3
        cp "$BASE_DIR/i3/config-degenerate" ~/.config/i3/config
        
        # Set wallpaper
        nitrogen --set-zoom-fill "$BASE_DIR/wallpapers/degenerate_wallpaper.jpg" 2>/dev/null || \
            feh --bg-fill "$BASE_DIR/wallpapers/degenerate_wallpaper.jpg"
        
        # Restart i3
        i3-msg reload 2>/dev/null
        i3-msg restart 2>/dev/null
        
        # Kill any existing picom and start with degenerate config
        pkill picom 2>/dev/null
        sleep 0.5
        picom --config "$BASE_DIR/picom/picom-degenerate.conf" -b 2>/dev/null &
        
        echo -e "${RED}🍆 DEGENERATE MODE ACTIVATED 💦${RESET}"
        echo -e "${HOT_PINK}Hotkeys: Alt+F1=Degenerate | Alt+F2=Horny | Alt+F3=Normal${RESET}"
        echo -e "${HOT_PINK}Workspace names are now slutty and explicit! 🔥${RESET}"
        return
    fi
    
    # GNOME/GTK fallback (original code)
    # Set the explicit wallpaper
    gsettings set org.gnome.desktop.background picture-uri "file://$BASE_DIR/wallpapers/degenerate_wallpaper.jpg" 2>/dev/null || true
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$BASE_DIR/wallpapers/degenerate_wallpaper.jpg" 2>/dev/null || true
    
    # Apply degenerate GTK theme
    if [ -f "$BASE_DIR/themes/degenerate-gtk.css" ]; then
        mkdir -p ~/.config/gtk-3.0
        cp "$BASE_DIR/themes/degenerate-gtk.css" ~/.config/gtk-3.0/gtk.css
        echo -e "${HOT_PINK}💦 GTK theme applied - cum-stained interface activated${RESET}"
    fi
    
    # Apply terminal theme
    if [ -f "$BASE_DIR/terminal-themes/degenerate-bash-prompt.sh" ]; then
        # Add to bashrc if not present
        if ! grep -q "DEGENERATE MODE BASH PROMPT" ~/.bashrc 2>/dev/null; then
            cat "$BASE_DIR/terminal-themes/degenerate-bash-prompt.sh" >> ~/.bashrc
            echo -e "${HOT_PINK}🍆 Terminal prompt will be cum-stained after restart${RESET}"
        fi
    fi
    
    # Create desktop shortcuts for adult sites
    create_adult_site_shortcuts
    
    # Set transparency for degenerate mode (85%)
    gsettings set org.gnome.shell.extensions.user-theme name "Adwaita-dark" 2>/dev/null || true
    
    echo -e "${RED}🍆 DEGENERATE MODE ACTIVATED 💦${RESET}"
    echo -e "${HOT_PINK}Your desktop is now dripping with filth, slut!${RESET}"
}

apply_horny_mode() {
    echo -e "${PINK}💋 ACTIVATING HORNY MODE - SENSUAL VIBES 💋${RESET}"
    
    # Check if we're running i3
    if pgrep -x "i3" > /dev/null 2>&1; then
        echo -e "${PINK}💦 i3 detected - switching to horny i3 config...${RESET}"
        
        # Copy i3 config
        mkdir -p ~/.config/i3
        cp "$BASE_DIR/i3/config-horny" ~/.config/i3/config
        
        # Set wallpaper
        nitrogen --set-zoom-fill "$BASE_DIR/wallpapers/horny_wallpaper.jpg" 2>/dev/null || \
            feh --bg-fill "$BASE_DIR/wallpapers/horny_wallpaper.jpg"
        
        # Restart i3
        i3-msg reload 2>/dev/null
        i3-msg restart 2>/dev/null
        
        # Kill any existing picom and start with horny config
        pkill picom 2>/dev/null
        sleep 0.5
        picom --config "$BASE_DIR/picom/picom-horny.conf" -b 2>/dev/null &
        
        echo -e "${PINK}💋 HORNY MODE ACTIVATED 💦${RESET}"
        echo -e "${HOT_PINK}Hotkeys: Alt+F1=Degenerate | Alt+F2=Horny | Alt+F3=Normal${RESET}"
        echo -e "${HOT_PINK}Workspace names are now flirty and sensual! 🌹${RESET}"
        return
    fi
    
    # GNOME/GTK fallback (original code)
    # Set the sexy lingerie wallpaper
    gsettings set org.gnome.desktop.background picture-uri "file://$BASE_DIR/wallpapers/horny_wallpaper.jpg" 2>/dev/null || true
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$BASE_DIR/wallpapers/horny_wallpaper.jpg" 2>/dev/null || true
    
    # Apply horny GTK theme
    if [ -f "$BASE_DIR/themes/horny-gtk.css" ]; then
        mkdir -p ~/.config/gtk-3.0
        cp "$BASE_DIR/themes/horny-gtk.css" ~/.config/gtk-3.0/gtk.css
        echo -e "${PINK}💋 GTK theme applied - sensual interface activated${RESET}"
    fi
    
    # Apply terminal theme
    if [ -f "$BASE_DIR/terminal-themes/horny-bash-prompt.sh" ]; then
        if ! grep -q "HORNY MODE BASH PROMPT" ~/.bashrc 2>/dev/null; then
            cat "$BASE_DIR/terminal-themes/horny-bash-prompt.sh" >> ~/.bashrc
            echo -e "${PINK}🌹 Terminal prompt will be flirty after restart${RESET}"
        fi
    fi
    
    # Remove adult site shortcuts from desktop
    rm -f ~/Desktop/*Porn*.desktop 2>/dev/null
    rm -f ~/Desktop/*Xvideos*.desktop 2>/dev/null
    rm -f ~/Desktop/*Spankbang*.desktop 2>/dev/null
    rm -f ~/Desktop/*Hentai*.desktop 2>/dev/null
    
    # Set transparency for horny mode (70%)
    gsettings set org.gnome.shell.extensions.user-theme name "Adwaita" 2>/dev/null || true
    
    echo -e "${PINK}💋 HORNY MODE ACTIVATED 🌹${RESET}"
    echo -e "${HOT_PINK}Your desktop is now sensually charged, slut!${RESET}"
}

apply_normal_mode() {
    echo -e "${RESET}✨ ACTIVATING NORMAL MODE - CLEAN SLATE ✨${RESET}"
    
    # Check if we're running i3
    if pgrep -x "i3" > /dev/null 2>&1; then
        echo -e "🖥️  i3 detected - switching to normal i3 config..."
        
        # Copy i3 config
        mkdir -p ~/.config/i3
        cp "$BASE_DIR/i3/config-normal" ~/.config/i3/config
        
        # Remove wallpaper (use default)
        nitrogen --restore 2>/dev/null || true
        
        # Restart i3
        i3-msg reload 2>/dev/null
        i3-msg restart 2>/dev/null
        
        # Kill picom entirely for normal mode
        pkill picom 2>/dev/null
        
        echo -e "✨ NORMAL MODE ACTIVATED 🖥️"
        echo -e "Hotkeys: Alt+F1=Degenerate | Alt+F2=Horny | Alt+F3=Normal"
        return
    fi
    
    # GNOME/GTK fallback (original code)
    # Reset wallpaper to default
    gsettings reset org.gnome.desktop.background picture-uri 2>/dev/null || true
    gsettings reset org.gnome.desktop.background picture-uri-dark 2>/dev/null || true
    
    # Remove custom GTK theme
    rm -f ~/.config/gtk-3.0/gtk.css 2>/dev/null
    
    # Remove adult site shortcuts from desktop
    rm -f ~/Desktop/*Porn*.desktop 2>/dev/null
    rm -f ~/Desktop/*Xvideos*.desktop 2>/dev/null
    rm -f ~/Desktop/*Spankbang*.desktop 2>/dev/null
    rm -f ~/Desktop/*Hentai*.desktop 2>/dev/null
    rm -f ~/Desktop/*-DEGENERATE*.desktop 2>/dev/null
    rm -f ~/Desktop/*-HORNY*.desktop 2>/dev/null
    rm -f ~/Desktop/*-NORMAL*.desktop 2>/dev/null
    
    # Reset transparency
    gsettings reset org.gnome.shell.extensions.user-theme name 2>/dev/null || true
    
    echo -e "✨ NORMAL MODE ACTIVATED 🖥️"
    echo -e "Your desktop is now clean and professional."
}

create_adult_shortcuts() {
    DESKTOP="$HOME/Desktop"
    mkdir -p "$DESKTOP/🔥-ADULT-SITES"
    
    # Mainstream Tube Sites
    mkdir -p "$DESKTOP/🔥-ADULT-SITES/01-Mainstream"
    cat > "$DESKTOP/🔥-ADULT-SITES/01-Mainstream/Pornhub.desktop" << EOF
[Desktop Entry]
Name=🍆 Pornhub
Comment=The world's biggest porn tube site
Exec=firefox-esr --new-tab "https://pornhub.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/01-Mainstream/Xvideos.desktop" << EOF
[Desktop Entry]
Name=💦 Xvideos
Comment=Free porn videos
Exec=firefox-esr --new-tab "https://xvideos.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/01-Mainstream/Xnxx.desktop" << EOF
[Desktop Entry]
Name=🔥 Xnxx
Comment=Free sex tube
Exec=firefox-esr --new-tab "https://xnxx.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/01-Mainstream/Redtube.desktop" << EOF
[Desktop Entry]
Name=🍑 Redtube
Comment=Free porn videos
Exec=firefox-esr --new-tab "https://redtube.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/01-Mainstream/Youporn.desktop" << EOF
[Desktop Entry]
Name=👅 Youporn
Comment=Free porn tube
Exec=firefox-esr --new-tab "https://youporn.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/01-Mainstream/Tube8.desktop" << EOF
[Desktop Entry]
Name=🍌 Tube8
Comment=Porn video tube
Exec=firefox-esr --new-tab "https://tube8.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/01-Mainstream/Spankbang.desktop" << EOF
[Desktop Entry]
Name=👋 Spankbang
Comment=HD porn videos
Exec=firefox-esr --new-tab "https://spankbang.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/01-Mainstream/XHamster.desktop" << EOF
[Desktop Entry]
Name=🐹 xHamster
Comment=Free porn videos
Exec=firefox-esr --new-tab "https://xhamster.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    # Cam/OnlyFans Sites
    mkdir -p "$DESKTOP/🔥-ADULT-SITES/02-Cam-Sites"
    cat > "$DESKTOP/🔥-ADULT-SITES/02-Cam-Sites/Chaturbate.desktop" << EOF
[Desktop Entry]
Name=📹 Chaturbate
Comment=Free live sex cams
Exec=firefox-esr --new-tab "https://chaturbate.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/02-Cam-Sites/CamSoda.desktop" << EOF
[Desktop Entry]
Name=🎥 CamSoda
Comment=Live cam shows
Exec=firefox-esr --new-tab "https://camsoda.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/02-Cam-Sites/Stripchat.desktop" << EOF
[Desktop Entry]
Name=💃 Stripchat
Comment=Live sex cams
Exec=firefox-esr --new-tab "https://stripchat.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/02-Cam-Sites/BongaCams.desktop" << EOF
[Desktop Entry]
Name=🌟 BongaCams
Comment=Live adult cams
Exec=firefox-esr --new-tab "https://bongacams.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/02-Cam-Sites/MyFreeCams.desktop" << EOF
[Desktop Entry]
Name=💖 MyFreeCams
Comment=Free live cams
Exec=firefox-esr --new-tab "https://myfreecams.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/02-Cam-Sites/JerkMate.desktop" << EOF
[Desktop Entry]
Name=✊ JerkMate
Comment=Live cam experience
Exec=firefox-esr --new-tab "https://jerkmate.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    # Hentai/Rule34 Sites
    mkdir -p "$DESKTOP/🔥-ADULT-SITES/03-Hentai"
    cat > "$DESKTOP/🔥-ADULT-SITES/03-Hentai/HentaiHaven.desktop" << EOF
[Desktop Entry]
Name=🏮 Hentai Haven
Comment=Free hentai videos
Exec=firefox-esr --new-tab "https://hentaihaven.org"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/03-Hentai/Rule34.desktop" << EOF
[Desktop Entry]
Name=📜 Rule34
Comment=If it exists, there's porn of it
Exec=firefox-esr --new-tab "https://rule34.xxx"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/03-Hentai/E621.desktop" << EOF
[Desktop Entry]
Name=🐾 E621
Comment=Furry image board
Exec=firefox-esr --new-tab "https://e621.net"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/03-Hentai/Gelbooru.desktop" << EOF
[Desktop Entry]
Name=🎨 Gelbooru
Comment=Anime image board
Exec=firefox-esr --new-tab "https://gelbooru.com"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/03-Hentai/Danbooru.desktop" << EOF
[Desktop Entry]
Name=🌸 Danbooru
Comment=Anime image board
Exec=firefox-esr --new-tab "https://danbooru.donmai.us"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/03-Hentai/E-Hentai.desktop" << EOF
[Desktop Entry]
Name=📚 E-Hentai
Comment=Hentai manga archive
Exec=firefox-esr --new-tab "https://e-hentai.org"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/03-Hentai/ExHentai.desktop" << EOF
[Desktop Entry]
Name=🔐 ExHentai
Comment=Extreme hentai archive
Exec=firefox-esr --new-tab "https://exhentai.org"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    cat > "$DESKTOP/🔥-ADULT-SITES/03-Hentai/Luscious.desktop" << EOF
[Desktop Entry]
Name=🍑 Luscious
Comment=Hentai manga and videos
Exec=firefox-esr --new-tab "https://luscious.net"
Type=Application
Icon=firefox-esr
Categories=Network;WebBrowser;
Terminal=false
EOF
    
    # Make all shortcuts executable
    chmod +x "$DESKTOP/🔥-ADULT-SITES/"*/
    chmod +x "$DESKTOP/🔥-ADULT-SITES/"*/*.desktop 2>/dev/null || true
    
    echo -e "${PINK}💋 Adult site shortcuts created on Desktop! 🔥${RESET}"
}

remove_adult_shortcuts() {
    rm -rf "$HOME/Desktop/🔥-ADULT-SITES"
}

case "$MODE" in
    degenerate|DEGENERATE|degen|DEGEN|d|D)
        apply_degenerate_mode
        ;;
    horny|HORNY|h|H)
        apply_horny_mode
        ;;
    normal|NORMAL|n|N|clean|CLEAN|c|C)
        apply_normal_mode
        ;;
    *)
        echo -e "${RED}❌ Unknown mode: $MODE${RESET}"
        show_help
        exit 1
        ;;
esac

# Restart GNOME Shell to apply changes (optional - may cause flicker)
# echo -e "${PINK}💋 Restarting desktop...${RESET}"
# killall -3 gnome-shell 2>/dev/null || true

echo ""
echo -e "${PINK}✨ Mode switch complete! Enjoy your new desktop, slut! 💋${RESET}"
