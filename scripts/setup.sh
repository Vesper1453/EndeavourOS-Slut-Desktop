#!/bin/bash

# 🍆💦 Tails Slut Desktop Setup Script 💋🔥
# Run this once to prepare your Tails system for the sluttiest desktop experience

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

# Colors for output
PINK='\033[38;5;205m'
HOT_PINK='\033[38;5;198m'
RED='\033[38;5;196m'
PURPLE='\033[38;5;93m'
RESET='\033[0m'

echo -e "${PURPLE}"
echo "╔════════════════════════════════════════════════════════════╗"
echo "║         🍆💦 TAILS SLUT DESKTOP SETUP 💋🔥                ║"
echo "║                                                            ║"
echo "║     Preparing your system for maximum degeneracy...       ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo -e "${RESET}"
echo ""

# Check if running on Tails
if [ ! -f /etc/os-release ] || ! grep -q "Tails" /etc/os-release 2>/dev/null; then
    echo -e "${RED}⚠️ Warning: This doesn't appear to be Tails Linux${RESET}"
    echo "This setup is designed for Tails but may work on other Debian-based systems."
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Create necessary directories
echo -e "${HOT_PINK}💋 Creating directories...${RESET}"
mkdir -p "$HOME/.config/gtk-3.0"
mkdir -p "$HOME/.config/gtk-4.0"
mkdir -p "$HOME/.config/dconf"
mkdir -p "$HOME/.config/autostart"
mkdir -p "$HOME/Desktop"
mkdir -p "$HOME/.local/share/applications"
mkdir -p "$HOME/.themes"
mkdir -p "$HOME/.icons"

# Make scripts executable
echo -e "${HOT_PINK}💋 Setting up scripts...${RESET}"
chmod +x "$BASE_DIR/scripts/mode-switcher.sh"

# Create terminal profile with slutty colors
echo -e "${HOT_PINK}💋 Configuring terminal...${RESET}"

# Check if GNOME Terminal is available
if command -v gnome-terminal &> /dev/null; then
    echo -e "${PINK}  • GNOME Terminal detected${RESET}"
    
    # Set up a "SlutProfile" terminal profile
    PROFILE_UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
    
    if [ -n "$PROFILE_UUID" ]; then
        # Configure the default profile with slutty colors
        gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/" use-theme-colors false
        gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/" background-color "rgb(26,10,26)"
        gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/" foreground-color "rgb(255,105,180)"
        gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/" use-transparent-background true
        gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/" background-transparency-percent 15
        
        # Set palette colors (degenerate mode)
        gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/" palette "[
            'rgb(13,2,8)',      /* Black - deep degenerate bg */
            'rgb(255,0,51)',    /* Red - cum red */
            'rgb(255,20,147)',  /* Green - deep pink */
            'rgb(255,105,180)', /* Yellow - hot pink */
            'rgb(148,0,211)',   /* Blue - purple */
            'rgb(255,0,102)',   /* Magenta - accent */
            'rgb(255,182,193)', /* Cyan - pussy pink */
            'rgb(255,245,245)'  /* White - cum white */
        ]"
    fi
fi

# Install Compton/Picom for transparency (if not present)
echo -e "${HOT_PINK}💋 Setting up window transparency...${RESET}"
if ! command -v picom &> /dev/null && ! command -v compton &> /dev/null; then
    echo -e "${PINK}  • Note: picom/compton not installed. Window transparency requires compositor.${RESET}"
    echo -e "${PINK}  • On Tails, transparency works via GNOME's built-in compositor.${RESET}"
fi

# Create autostart entry for mode persistence
cat > "$HOME/.config/autostart/slut-desktop.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Slut Desktop Mode
Comment=Restore last used desktop mode
Exec=$BASE_DIR/scripts/mode-switcher.sh normal
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF

# Create desktop shortcut for mode switcher
cat > "$HOME/Desktop/🍆-Mode-Switcher.desktop" << EOF
[Desktop Entry]
Name=🍆 Mode Switcher
Comment=Switch between Degenerate, Horny, and Normal modes
Exec=gnome-terminal -- bash -c "$BASE_DIR/scripts/mode-switcher.sh --help; read -p 'Press Enter to exit...'"
Type=Application
Terminal=false
Icon=applications-system
Categories=System;Settings;
EOF

chmod +x "$HOME/Desktop/🍆-Mode-Switcher.desktop"

# Create quick mode shortcuts
cat > "$HOME/Desktop/🔥-DEGENERATE-MODE.desktop" << EOF
[Desktop Entry]
Name=🔥 DEGENERATE MODE
Comment=Maximum filth, pornographic, explicit
Exec=$BASE_DIR/scripts/mode-switcher.sh degenerate
Type=Application
Terminal=false
Icon=face-devilish
Categories=System;Settings;
EOF

cat > "$HOME/Desktop/💦-HORNY-MODE.desktop" << EOF
[Desktop Entry]
Name=💦 HORNY MODE
Comment=Sensual, sexy, flirty
Exec=$BASE_DIR/scripts/mode-switcher.sh horny
Type=Application
Terminal=false
Icon=face-kiss
Categories=System;Settings;
EOF

cat > "$HOME/Desktop/✨-NORMAL-MODE.desktop" << EOF
[Desktop Entry]
Name=✨ NORMAL MODE
Comment=Clean, professional, standard
Exec=$BASE_DIR/scripts/mode-switcher.sh normal
Type=Application
Terminal=false
Icon=face-plain
Categories=System;Settings;
EOF

chmod +x "$HOME/Desktop/🔥-DEGENERATE-MODE.desktop"
chmod +x "$HOME/Desktop/💦-HORNY-MODE.desktop"
chmod +x "$HOME/Desktop/✨-NORMAL-MODE.desktop"

# Set up Firefox/Tor Browser styling
echo -e "${HOT_PINK}💋 Setting up browser tweaks...${RESET}"
FIREFOX_PROFILE="$HOME/.mozilla/firefox"
if [ -d "$FIREFOX_PROFILE" ]; then
    for profile in "$FIREFOX_PROFILE"/*; do
        if [ -d "$profile" ] && [ -f "$profile/prefs.js" ]; then
            # Enable transparency support
            echo 'user_pref("browser.tabs.drawInTitlebar", true);' >> "$profile/user.js" 2>/dev/null || true
        fi
    done
fi

echo ""
echo -e "${PURPLE}"
echo "╔════════════════════════════════════════════════════════════╗"
echo "║                  ✅ SETUP COMPLETE! ✅                      ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo -e "${RESET}"
echo ""
echo -e "${HOT_PINK}💋 Your slutty Tails desktop is ready! Here's how to use it:${RESET}"
echo ""
echo "  🔥 DEGENERATE MODE: ./scripts/mode-switcher.sh degenerate"
echo "     - Explicit wallpaper, 85% transparent windows"
echo "     - Adult site shortcuts on desktop"
echo "     - Maximum filth theme"
echo ""
echo "  💦 HORNY MODE:      ./scripts/mode-switcher.sh horny"
echo "     - Sexy wallpaper, 70% transparent windows"
echo "     - Flirty pink theme"
echo ""
echo "  ✨ NORMAL MODE:     ./scripts/mode-switcher.sh normal"
echo "     - Clean Tails default"
echo "     - Removes adult shortcuts"
echo ""
echo -e "${PINK}Or use the desktop shortcuts: 🔥-DEGENERATE-MODE, 💦-HORNY-MODE, ✨-NORMAL-MODE${RESET}"
echo ""
echo -e "${PURPLE}Stay filthy, slut! 🍆💦💋${RESET}"
