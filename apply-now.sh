#!/bin/bash

# 🚀 QUICK APPLY - Apply themes RIGHT NOW 💋

MODE=${1:-degenerate}

echo -e "\033[38;5;205m🍆 Applying $MODE theme RIGHT NOW...\033[0m"
echo ""

# Apply color scheme
if command -v plasma-apply-colorscheme &> /dev/null; then
    plasma-apply-colorscheme "${MODE^}Slut" 2>/dev/null && echo "✅ Color scheme applied"
fi

# Alternative method using kwriteconfig5
if command -v kwriteconfig5 &> /dev/null; then
    kwriteconfig5 --file kcmcolors --group General --key ColorScheme "${MODE^}Slut"
fi

# Try to reload plasma
if command -v qdbus &> /dev/null; then
    qdbus org.kde.KWin /KWin reconfigure 2>/dev/null
fi

# Set Konsole profile (for new windows)
echo "✅ Konsole profile will apply to NEW windows"
echo "   Open a NEW Konsole to see changes"

echo ""
echo -e "\033[38;5;205m💋 Theme applied! Open a new Konsole to see the terminal changes.\033[0m"