#!/bin/bash

# 🔍 COLOR VERIFICATION SCRIPT 💋
# Shows exactly what colors are defined

echo -e "\033[38;5;205m╔════════════════════════════════════════════════╗"
echo -e "║  🎨  COLOR VERIFICATION  🎨                   ║"
echo -e "╚════════════════════════════════════════════════╝\033[0m"
echo ""

echo -e "\033[38;5;198m💋 DEGENERATE MODE COLORS:\033[0m"
echo "Background: #0D0208 (Very dark burgundy-black)"
echo "Foreground: #FF1493 (Deep pink)"
echo "Accent:     #FF1493 (Deep pink)"
echo "Selection:  #C71585 (Medium violet-red)"
echo ""
echo -e "\033[48;5;53m\033[38;5;198m  This is DEGENERATE background  \033[0m"
echo -e "\033[48;5;89m\033[38;5;205m  This is DEGENERATE accent  \033[0m"
echo ""

echo -e "\033[38;5;205m💕 HORNY MODE COLORS:\033[0m"
echo "Background: #1A0510 (Dark burgundy)"
echo "Foreground: #FF8080 (Light coral)"
echo "Accent:     #FF8080 (Light coral)"
echo "Selection:  #DB7093 (Pale violet-red)"
echo ""
echo -e "\033[48;5;88m\033[38;5;210m  This is HORNY background  \033[0m"
echo -e "\033[48;5;174m\033[38;5;88m  This is HORNY accent  \033[0m"
echo ""

echo -e "\033[38;5;252m🖥️  NORMAL MODE COLORS:\033[0m"
echo "Background: #232323 (Dark gray)"
echo "Foreground: #F0F0F0 (Light gray)"
echo "Accent:     #0078D4 (Windows blue)"
echo "Selection:  #0078D4 (Blue)"
echo ""
echo -e "\033[48;5;235m\033[38;5;252m  This is NORMAL background  \033[0m"
echo -e "\033[48;5;32m\033[38;5;255m  This is NORMAL accent  \033[0m"
echo ""

echo -e "\033[38;5;198mTo apply colors, run:\033[0m"
echo "  ~/kde-mode-switcher.sh degenerate"
echo "  ~/kde-mode-switcher.sh horny"
echo "  ~/kde-mode-switcher.sh normal"
echo ""
echo -e "\033[38;5;196m⚠️  NOTE: Colors may look different depending on your monitor!\033[0m"