#!/bin/bash

# 🔧 PACKAGE FIXER FOR ENDEAVOUROS 💋
# Fixes common package installation issues

echo -e "\033[38;5;205m🍆💦 Checking what packages need fixing...\033[0m"
echo ""

# Critical packages that must be installed
CRITICAL=(
    "kdialog"
    "konsole"
    "zsh"
    "git"
    "curl"
    "wget"
    "feh"
    "nitrogen"
    "picom"
    "rofi"
    "neofetch"
    "cowsay"
    "fortune-mod"
    "cmatrix"
    "htop"
    "btop"
    "ranger"
    "mpv"
    "ffmpeg"
    "chafa"
    "libcaca"
    "imagemagick"
    "xdotool"
    "wmctrl"
    "libnotify"
    "dunst"
    "polybar"
    "conky"
)

echo "=== CHECKING INSTALLED PACKAGES ==="
MISSING=()

for pkg in "${CRITICAL[@]}"; do
    if pacman -Q "$pkg" &>/dev/null; then
        echo "✅ $pkg"
    else
        echo "❌ $pkg - MISSING"
        MISSING+=("$pkg")
    fi
done

echo ""
echo "=== MISSING PACKAGES: ${#MISSING[@]} ==="

if [ ${#MISSING[@]} -eq 0 ]; then
    echo -e "\033[38;5;82m✅ All critical packages installed!\033[0m"
    exit 0
fi

echo ""
echo "=== ATTEMPTING TO INSTALL MISSING PACKAGES ==="

# Update first
sudo pacman -Sy

# Try installing missing packages one by one
FAILED_AUR=()
FAILED_PACMAN=()

for pkg in "${MISSING[@]}"; do
    echo ""
    echo -e "\033[38;5;198m💋 Installing $pkg...\033[0m"
    
    # Try pacman first
    if sudo pacman -S --needed --noconfirm "$pkg" 2>/dev/null; then
        echo "✅ $pkg installed via pacman"
    else
        # Check if it's an AUR package
        FAILED_PACMAN+=("$pkg")
        echo "⚠️  $pkg not in official repos (might be AUR)"
    fi
done

# Check for AUR helper and install AUR packages
echo ""
echo "=== CHECKING FOR AUR PACKAGES ==="

AUR_HELPER=""
if command -v yay &> /dev/null; then
    AUR_HELPER="yay"
elif command -v paru &> /dev/null; then
    AUR_HELPER="paru"
fi

if [ -n "$AUR_HELPER" ] && [ ${#FAILED_PACMAN[@]} -gt 0 ]; then
    echo "✅ AUR helper found: $AUR_HELPER"
    echo "Installing AUR packages..."
    
    if [ "$AUR_HELPER" = "yay" ]; then
        yay -S --needed --noconfirm "${FAILED_PACMAN[@]}" 2>/dev/null || {
            echo "⚠️  Some AUR packages failed"
        }
    else
        paru -S --needed --noconfirm "${FAILED_PACMAN[@]}" 2>/dev/null || {
            echo "⚠️  Some AUR packages failed"
        }
    fi
elif [ ${#FAILED_PACMAN[@]} -gt 0 ]; then
    echo ""
    echo -e "\033[38;5;196m⚠️  MISSING PACKAGES THAT NEED AUR:\033[0m"
    printf '%s\n' "${FAILED_PACMAN[@]}"
    echo ""
    echo "Install yay to get these packages:"
    echo "  git clone https://aur.archlinux.org/yay.git"
    echo "  cd yay && makepkg -si"
fi

echo ""
echo -e "\033[38;5;205m✅ Package fix complete! Run install.sh again.\033[0m"