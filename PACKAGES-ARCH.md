# 📦 Package List for Arch Linux / EndeavourOS

This document lists all the slutty tools and packages for Arch-based systems (including EndeavourOS).

---

## 🎯 Core Requirements

### Base Packages (pacman)
```bash
sudo pacman -S --needed \
    i3-wm i3status i3lock dmenu \
    picom nitrogen kitty rofi polybar \
    dunst lxappearance \
    ffmpegthumbnailer mpv \
    feh imagemagick \
    ttf-nerd-fonts-symbols-mono \
    noto-fonts noto-fonts-emoji
```

### AUR Packages (yay/paru)
```bash
yay -S --needed \
    i3-gaps-rounded-git \
    picom-ibhagwan-git \
    cava \
    cli-visualizer
```

---

## 🔥 Mode-Specific Packages

### Degenerate Mode Extras
```bash
# ASCII/Sixel video playback
sudo pacman -S --needed \
    mpv \
    libcaca \
    libsixel

# AUR: Advanced terminal video
yay -S --needed \
    mpv-sixel \
    timg
```

### Terminal Goodies
```bash
sudo pacman -S --needed \
    zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions \
    oh-my-zsh \
    fortune-mod \
    cowsay \
    lolcat \
    neofetch

# AUR: More slutty terminal toys
yay -S --needed \
    pokemonsay \
    parrot
```

### File Management
```bash
sudo pacman -S --needed \
    ranger \
    ueberzug \
    ffmpegthumbnailer

yay -S --needed \
    ranger-zsh-completion
```

### Browser (for adult sites)
```bash
sudo pacman -S --needed \
    firefox \
    tor-browser-bin  # from AUR

# Or
yay -S --needed \
    brave-bin \
    librewolf-bin
```

---

## 🎨 Theme Dependencies

### GTK Themes
```bash
sudo pacman -S --needed \
    arc-gtk-theme \
    papirus-icon-theme \
    breeze-icons \
    gtk-engine-murrine \
    gtk-engines
```

### Fonts (for sexy text rendering)
```bash
sudo pacman -S --needed \
    ttf-dejavu \
    ttf-liberation \
    ttf-roboto \
    ttf-ubuntu-font-family \
    ttf-jetbrains-mono \
    ttf-fira-code \
    noto-fonts-cjk \
    ttf-font-awesome \

# AUR
yay -S --needed \
    ttf-icomoon-feather \
    ttf-material-design-icons-webfont
```

---

## 🖥️ Desktop Environment Alternatives

### If you prefer GNOME over i3
```bash
sudo pacman -S --needed \
    gnome-shell \
    gnome-terminal \
    gnome-tweaks \
    gnome-extensions-app
```

### KDE/Plasma (slutty options)
```bash
sudo pacman -S --needed \
    plasma-desktop \
    konsole \
    dolphin \
    plasma-pa \
    plasma-nm
```

---

## 🎬 Terminal Video Dependencies

For the terminal video viewer to work:
```bash
# Basic ASCII playback (always works)
sudo pacman -S --needed \
    mpv \
    libcaca

# Sixel support (high quality terminal graphics)
sudo pacman -S --needed \
    libsixel \
    termux-sixel  # if available

# Or build mpv with sixel:
yay -S --needed \
    mpv-sixel
```

---

## 🚨 Panic Button Dependencies
```bash
sudo pacman -S --needed \
    wmctrl \
    xdotool \
    xclip
```

---

## 🍑 Optional Extras (for maximum sluttery)

```bash
# Conky for sexy desktop widgets
sudo pacman -S --needed conky-lua-nv

# CMatrix with sexy colors
sudo pacman -S --needed cmatrix

# ASCII art generators
sudo pacman -S --needed \
    figlet \
    toilet \
    boxes

# Image viewers with transparency support
yay -S --needed \
    sxiv-rifle \
    imv

# Audio visualizer for your moans
yay -S --needed \
    cava \
    cli-visualizer
```

---

## 📋 Complete One-Liner (Arch/EndeavourOS)

```bash
# Install everything needed
sudo pacman -S --needed i3-wm i3status i3lock dmenu picom nitrogen kitty rofi polybar dunst lxappearance feh imagemagick mpv libcaca libsixel zsh fortune-mod cowsay neofetch ranger arc-gtk-theme papirus-icon-theme noto-fonts noto-fonts-emoji ttf-nerd-fonts-symbols-mono ttf-dejavu ttf-font-awesome wmctrl xdotool xclip

# Install AUR packages with yay (EndeavourOS has yay pre-installed)
yay -S --needed i3-gaps-rounded-git picom-ibhagwan-git cava
```

---

## 🔍 Package Name Differences (Debian vs Arch)

| Debian | Arch |
|--------|------|
| `i3` | `i3-wm` |
| `i3-wm` | `i3-wm` (same) |
| `picom` | `picom` (or `picom-ibhagwan-git` for rounded corners) |
| `nitrogen` | `nitrogen` |
| `rxvt-unicode` | `rxvt-unicode` |
| `fonts-noto` | `noto-fonts` |
| `fonts-font-awesome` | `ttf-font-awesome` |

---

## 💋 Stay Filthy on Arch!

*EndeavourOS is the perfect slutty distro - it has yay pre-installed and a sexy installer. Arch pure and simple!* 🔥