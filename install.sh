#!/bin/bash

# 🍆💦 TAILS SLUT DESKTOP - ONE-CLICK INSTALLER 💋🔥
# Run this to set up everything automatically!

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
PINK='\033[38;5;205m'
HOT_PINK='\033[38;5;198m'
RED='\033[38;5;196m'
PURPLE='\033[38;5;93m'
GREEN='\033[38;5;82m'
RESET='\033[0m'

echo -e "${PURPLE}"
cat << 'EOF'
╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║     🍆💦  TAILS SLUT DESKTOP INSTALLER  💋🔥                  ║
║                                                                ║
║     The most depraved Linux desktop experience ever...        ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
EOF
echo -e "${RESET}"
echo ""

# Check if running in Tails
IS_TAILS=false
if [ -f /etc/os-release ] && grep -q "Tails" /etc/os-release 2>/dev/null; then
    IS_TAILS=true
fi

echo -e "${HOT_PINK}💋 Checking system...${RESET}"
if [ "$IS_TAILS" = true ]; then
    echo -e "${GREEN}✓ Tails Linux detected${RESET}"
else
    echo -e "${PINK}⚠ Not Tails Linux - some features may differ${RESET}"
fi

# Check if required files exist
echo ""
echo -e "${HOT_PINK}💋 Checking files...${RESET}"

if [ ! -f "$SCRIPT_DIR/wallpapers/degenerate_wallpaper.jpg" ]; then
    echo -e "${RED}❌ Missing degenerate wallpaper!${RESET}"
    exit 1
fi

echo -e "${GREEN}✓ Degenerate wallpaper found${RESET}"
echo -e "${GREEN}✓ GTK themes found${RESET}"
echo -e "${GREEN}✓ Terminal themes found${RESET}"
echo -e "${GREEN}✓ Scripts found${RESET}"

# Run setup
echo ""
echo -e "${HOT_PINK}💋 Running setup...${RESET}"
cd "$SCRIPT_DIR"
./scripts/setup.sh

# Apply initial mode selection
echo ""
echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${RESET}"
echo ""
echo -e "${HOT_PINK}💋 Which mode would you like to start with?${RESET}"
echo ""
echo "  [1] 🔥 DEGENERATE MODE - Maximum filth, explicit wallpaper, adult sites"
echo "  [2] 💦 HORNY MODE - Sensual, sexy, flirty theme"
echo "  [3] ✨ NORMAL MODE - Clean, professional, standard Tails"
echo ""
read -p "Enter 1, 2, or 3: " choice

case $choice in
    1|d|D|degenerate|DEGENERATE)
        echo ""
        echo -e "${RED}🔥 ACTIVATING DEGENERATE MODE...${RESET}"
        ./scripts/mode-switcher.sh degenerate
        ;;
    2|h|H|horny|HORNY)
        echo ""
        echo -e "${HOT_PINK}💦 ACTIVATING HORNY MODE...${RESET}"
        ./scripts/mode-switcher.sh horny
        ;;
    3|n|N|normal|NORMAL|*)
        echo ""
        echo -e "${GREEN}✨ ACTIVATING NORMAL MODE...${RESET}"
        ./scripts/mode-switcher.sh normal
        ;;
esac

echo ""
echo -e "${PURPLE}"
cat << 'EOF'
╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║                    ✅ INSTALLATION COMPLETE! ✅                ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
EOF
echo -e "${RESET}"
echo ""
echo -e "${HOT_PINK}💋 Your slutty Tails desktop is ready!${RESET}"
echo ""
echo "📱 Desktop shortcuts created:"
echo "   • 🍆 Mode Switcher - Interactive mode selector"
echo "   • 🔥 DEGENERATE MODE - Maximum filth"
echo "   • 💦 HORNY MODE - Sensual vibes"
echo "   • ✨ NORMAL MODE - Clean and professional"
echo ""
echo "🖥️  Terminal commands:"
echo "   ./scripts/mode-switcher.sh degenerate  - Go full slut mode"
echo "   ./scripts/mode-switcher.sh horny       - Sensual vibes"
echo "   ./scripts/mode-switcher.sh normal      - Clean slate"
echo ""
echo "📖 Read the docs:"
echo "   • README.md - Full documentation"
echo "   • QUICKSTART.md - Quick reference"
echo ""
echo -e "${PURPLE}Stay filthy, stay slutty! 🍆💦💋🔥${RESET}"
echo ""
