#!/bin/bash

# 🔧 THEME FIXER - Diagnose and fix theme issues 💋

echo -e "\033[38;5;205m🔍 DIAGNOSING THEME ISSUES...\033[0m"
echo ""

# Check 1: Are we in the right directory?
echo "=== 1. Checking Directory ==="
if [ -f "install.sh" ]; then
    echo "✅ Correct directory found"
else
    echo "❌ ERROR: Run this from the EndeavourOS-Slut-Desktop folder!"
    echo "   cd ~/EndeavourOS-Slut-Desktop"
    exit 1
fi

# Check 2: Do KDE color schemes exist?
echo ""
echo "=== 2. Checking KDE Color Schemes ==="
mkdir -p ~/.local/share/color-schemes
cp kde/colors/*.colors ~/.local/share/color-schemes/ 2>/dev/null && echo "✅ Color schemes copied" || echo "❌ Failed to copy color schemes"
ls -la ~/.local/share/color-schemes/*.colors 2>/dev/null | head -5

# Check 3: Do Konsole profiles exist?
echo ""
echo "=== 3. Checking Konsole Profiles ==="
mkdir -p ~/.local/share/konsole
cp terminal/konsole/*.profile ~/.local/share/konsole/ 2>/dev/null && echo "✅ Konsole profiles copied" || echo "❌ Failed to copy Konsole profiles"
cp terminal/konsole/*.colorscheme ~/.local/share/konsole/ 2>/dev/null && echo "✅ Konsole color schemes copied" || echo "❌ Failed to copy Konsole color schemes"
ls -la ~/.local/share/konsole/ 2>/dev/null | head -10

# Check 4: Does the mode switcher exist?
echo ""
echo "=== 4. Checking Mode Switcher ==="
mkdir -p ~/.config/slutterminal/kde
cp kde/scripts/kde-mode-switcher.sh ~/.config/slutterminal/kde/ 2>/dev/null
cp kde/scripts/transparency-*.sh ~/.config/slutterminal/kde/ 2>/dev/null
cp kde/scripts/kde-mode-switcher.sh ~/kde-mode-switcher.sh 2>/dev/null
chmod +x ~/kde-mode-switcher.sh 2>/dev/null
chmod +x ~/.config/slutterminal/kde/*.sh 2>/dev/null
ls -la ~/kde-mode-switcher.sh 2>/dev/null && echo "✅ Mode switcher found" || echo "❌ Mode switcher missing"

# Check 5: ZSH configs
echo ""
echo "=== 5. Checking ZSH Configs ==="
mkdir -p ~/.config/slutterminal/zsh
cp terminal/zsh/*.zsh ~/.config/slutterminal/zsh/ 2>/dev/null
ls -la ~/.config/slutterminal/zsh/ 2>/dev/null | head -5

# Check 6: Is zsh the default shell?
echo ""
echo "=== 6. Checking Default Shell ==="
current_shell=$(echo $SHELL)
echo "Current shell: $current_shell"
if [[ "$current_shell" == *"zsh"* ]]; then
    echo "✅ ZSH is already the default shell"
else
    echo "❌ ZSH is NOT the default shell (currently: $current_shell)"
    echo "   To fix: chsh -s $(which zsh)"
    echo "   Then log out and back in"
fi

# Check 7: Try to apply a theme
echo ""
echo "=== 7. Testing Theme Application ==="
echo "Applying Degenerate theme..."
lookandfeeltool -a com.github.degenerateslut 2>/dev/null || echo "❌ lookandfeeltool failed (expected if not installed)"

# Try plasma-apply-colorscheme
if command -v plasma-apply-colorscheme &> /dev/null; then
    plasma-apply-colorscheme DegenerateSlut 2>/dev/null && echo "✅ Applied DegenerateSlut color scheme" || echo "❌ Failed to apply color scheme"
else
    echo "⚠️  plasma-apply-colorscheme not found - will use kwriteconfig5 instead"
fi

echo ""
echo -e "\033[38;5;205m💋 DIAGNOSIS COMPLETE!\033[0m"
echo ""
echo "=== MANUAL FIXES YOU MAY NEED ==="
echo ""
echo "1. To apply KDE color scheme MANUALLY:"
echo "   System Settings → Appearance → Colors → Select DegenerateSlut"
echo ""
echo "2. To set Konsole profile MANUALLY:"
echo "   Konsole → Settings → Manage Profiles → Select DegenerateSlut"
echo ""
echo "3. To set ZSH as default:"
echo "   chsh -s \$(which zsh)"
echo "   Then LOG OUT and back in"
echo ""
echo "4. To run mode switcher:"
echo "   ~/kde-mode-switcher.sh degenerate"
echo ""