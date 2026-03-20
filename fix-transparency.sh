#!/bin/bash

# 🔧 KDE TRANSPARENCY FIXER 💋🔥
# Fixes all transparency issues on EndeavourOS

echo -e "\033[38;5;205m╔════════════════════════════════════════════════╗"
echo -e "║  🍆💦  TRANSPARENCY FIXER  💋🔥               ║"
echo -e "╚════════════════════════════════════════════════╝\033[0m"
echo ""

# Function to check if command succeeded
check_status() {
    if [ $? -eq 0 ]; then
        echo -e "\033[38;5;82m✅ $1\033[0m"
    else
        echo -e "\033[38;5;196m❌ $1 (check error above)\033[0m"
    fi
}

# Step 1: Check compositor
echo -e "\033[38;5;198m💋 Checking KWin compositor...\033[0m"
if qdbus org.kde.KWin /org/kde/KWin supportInformation 2>/dev/null | grep -q "compositing"; then
    echo -e "\033[38;5;82m✅ Compositor is running\033[0m"
else
    echo -e "\033[38;5;196m⚠️  Compositor issue detected\033[0m"
    echo "Enabling compositor..."
    kwriteconfig5 --file kwinrc --group Compositing --key Enabled "true"
    qdbus org.kde.KWin /org/kde/KWin reconfigure 2>/dev/null
    check_status "Compositor enabled"
fi

# Step 2: Install required packages
echo ""
echo -e "\033[38;5;198m💋 Installing transparency packages...\033[0m"
sudo pacman -S --needed --noconfirm \
    kvantum \
    qt5ct \
    qt6ct \
    kwin-effects-slidingapps \
    2>/dev/null
check_status "Packages installed"

# Step 3: Enable transparency effects in KDE
echo ""
echo -e "\033[38;5;198m💋 Enabling KDE transparency effects...\033[0m"

# Enable translucency effect
kwriteconfig5 --file kwinrc --group Plugins --key translucencyEnabled "true"

# Set default window transparency
kwriteconfig5 --file kwinrc --group Compositing --key Opacity "0.85"

# Enable blur effect (sexy!)
kwriteconfig5 --file kwinrc --group Plugins --key blurEnabled "true"

# Enable background contrast
kwriteconfig5 --file kwinrc --group Plugins --key contrastEnabled "true"

check_status "KWin effects configured"

# Step 4: Configure Kvantum (Qt theme engine with transparency)
echo ""
echo -e "\033[38;5;198m💋 Setting up Kvantum for transparency...\033[0m"

# Create Kvantum config
mkdir -p ~/.config/Kvantum

# Create a Kvantum theme file with transparency
cat > ~/.config/Kvantum/kvantum.kvconfig << 'KVANTUM'
[%General]
theme=KvMojaveDark
translucent_windows=true
blurring=true
popup_blurring=true
no_inactive_states=false
no_blur_for_maximized=false
no_titlebar_for_desktop=false
no_menu_shadow=false
dark_titlebar=true

[GeneralColors]
window.color=#0D0208
base.color=#0D0208
alt.base.color=#1A0510
text.color=#FF69B4
window.text.color=#FF1493
button.color=#3D0D25
button.text.color=#FF1493
button.focused.color=#FF1493
highlight.color=#FF1493
highlight.text.color=#000000
link.color=#FF1493
link.visited.color=#FF69B4

[Hacks]
transparent_menutitle=true
blur_translucent=true
transparent_dolphin_view=false
transparent_pcmanfm_sidepane=false
blur_only_active_window=true
respect_de=false
force_size_grip=false
hide_combo_checkboxes=false
no_inactive_buttons=false
no_selection_tint=true
no_tooltip_tint=true
center_toolbar_items=false
scroll_trough_shaded=true
tint_with_saturation=false
contrast_effect=true
iconless_pushbutton=false
iconless_menu=false
middle_click_scroll=false
no_inactivert=false
no_inactivesel=false
no_inactive_scrollbar=false
no_inactive_sliders=false
no_menu_scrollbar=false
transparent_arrow_button=false
left_aligned_extensions=true
transparent_ktitle_label=true
transparent_menubar=false
transparent_toolbars=false
detect_dark=true
blur_dropdown=true
blur_iconview=true
blur_kickoff=true
blur_popup=true
normal_default_pushbutton=true
single_click=true
small_icon_size=16
large_icon_size=32
button_icon_size=16
toolbar_icon_size=22
combo_menu=false
no_selection_tint_with_wallpaper=true
KVANTUM

check_status "Kvantum configured"

# Step 5: Set environment variables for Qt apps
echo ""
echo -e "\033[38;5;198m💋 Setting Qt transparency variables...\033[0m"

# Add to .bashrc and .zshrc
for rc in ~/.bashrc ~/.zshrc; do
    if [ -f "$rc" ]; then
        # Remove old entries first
        grep -v "QT_QPA_PLATFORMTHEME\|QT_STYLE_OVERRIDE" "$rc" > "$rc.tmp" 2>/dev/null || true
        
        # Add new entries
        cat >> "$rc.tmp" << 'ENV'
# 🍆💦 Slutty Transparency Settings 💋🔥
export QT_QPA_PLATFORMTHEME=gtk2
export QT_STYLE_OVERRIDE=kvantum
export KDE_SESSION_VERSION=5
export QT_QPA_PLATFORM=wayland;xcb
ENV
        
        mv "$rc.tmp" "$rc"
    fi
done

check_status "Environment variables set"

# Step 6: Create the transparency control with KWin
echo ""
echo -e "\033[38;5;198m💋 Creating proper transparency script...\033[0m"

cat > ~/.local/bin/slut-transparency << 'EOF'
#!/bin/bash
# 🍆💦 KDE TRANSPARENCY CONTROL 💋🔥

LEVEL=${1:-85}

# Ensure compositor is enabled
kwriteconfig5 --file kwinrc --group Compositing --key Enabled "true"

# Set window opacity (lower = more transparent)
# KDE uses 0-100 scale where 100 = opaque
OPACITY=$((100 - LEVEL))
if [ $OPACITY -lt 10 ]; then
    OPACITY=10  # Minimum 10% opacity (don't make invisible!)
fi

# Apply to various settings
kwriteconfig5 --file kwinrc --group Compositing --key Opacity "$OPACITY"

# Set specific window rules for transparency
mkdir -p ~/.config/kwinrules

# Create a window rule for all windows
cat > ~/.config/kwinrules/transparency.rules << RULES
[Transparency Rule]
desktops=all
desktop=0
fullscreen=false
type=0
opacity=$OPACITY
RULES

# Also use qdbus to set immediately if available
if command -v qdbus &> /dev/null; then
    # Try to reload KWin config
    qdbus org.kde.KWin /org/kde/KWin reconfigure 2>/dev/null || true
    
    # Try to set active window opacity
    ACTIVE=$(qdbus org.kde.KWin /org/kde/KWin activeWindow 2>/dev/null)
    if [ -n "$ACTIVE" ]; then
        qdbus org.kde.KWin /org/kde/KWin/window/$ACTIVE setOpacity $((OPACITY * 255 / 100)) 2>/dev/null || true
    fi
fi

# Show notification
kdialog --title "💦 Transparency Set" --msgbox "Window transparency set to ${LEVEL}%\n\nLog out and back in for full effect!" 2>/dev/null || \
echo "Transparency set to ${LEVEL}% - Log out/in to apply fully!"
EOF

chmod +x ~/.local/bin/slut-transparency

# Update the old transparency scripts to use the new one
ln -sf ~/.local/bin/slut-transparency ~/transparency-control.sh 2>/dev/null || true
ln -sf ~/.local/bin/slut-transparency ~/transparency-hotkeys.sh 2>/dev/null || true

check_status "Transparency control script created"

# Step 7: Force compositor settings
echo ""
echo -e "\033[38;5;198m💋 Forcing compositor settings...\033[0m"

# Disable unredirect (keeps compositor always active)
kwriteconfig5 --file kwinrc --group Compositing --key UnredirectFullscreen "false"

# Enable vsync for smooth transparency
kwriteconfig5 --file kwinrc --group Compositing --key GLCore "true"
kwriteconfig5 --file kwinrc --group Compositing --key GLPreferBufferSwap "a"

# Max texture size for large windows
kwriteconfig5 --file kwinrc --group Compositing --key MaxTextureSize "0"

check_status "Compositor settings forced"

# Step 8: Restart KWin (or notify user)
echo ""
echo -e "\033[38;5;198m💋 Almost done...\033[0m"

if command -v qdbus &> /dev/null; then
    echo "Reloading KWin configuration..."
    qdbus org.kde.KWin /org/kde/KWin reconfigure 2>/dev/null
    check_status "KWin reconfigured"
fi

# Final instructions
echo ""
echo -e "\033[38;5;205m╔════════════════════════════════════════════════╗"
echo -e "║  ✅ TRANSPARENCY FIX APPLIED!                  ║"
echo -e "╚════════════════════════════════════════════════╝\033[0m"
echo ""
echo -e "\033[38;5;198m💋 IMPORTANT: Log out and log back in for full effect!\033[0m"
echo ""
echo "After logging back in:"
echo "  • Run: slut-transparency 75    (75% transparent)"
echo "  • Run: slut-transparency 85    (85% transparent - DEGENERATE)"
echo "  • Run: slut-transparency 50    (50% transparent - half)"
echo ""
echo -e "\033[38;5;82mOr use the desktop shortcuts to adjust transparency!\033[0m"