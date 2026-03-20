# 📦 EndeavourOS Package List

Complete package list for the **EndeavourOS Slut Desktop**.

**⚠️ FOR ENDEAVOUROS/ARCH LINUX ONLY ⚠️**

---

## 🚀 Core System (EndeavourOS Base)

EndeavourOS comes pre-installed with:
- `firefox` - Web browser
- `yay` - AUR helper ✨
- `base-devel` - Compiling tools
- `nvidia`/`amd` drivers (if applicable)

---

## 📦 Required Packages

Install all with:
```bash
sudo pacman -S --needed i3-wm i3status i3lock dmenu i3-gaps picom nitrogen kitty rofi polybar dunst
```

### Window Manager
| Package | Purpose |
|---------|---------|
| `i3-wm` | Tiling window manager |
| `i3-gaps` | Window gaps |
| `i3status` | Status bar |
| `i3lock` | Screen locker |
| `dmenu` | Application menu |

### Compositor & Appearance
| Package | Purpose |
|---------|---------|
| `picom` | Transparency/compositing |
| `nitrogen` | Wallpaper setter |
| `lxappearance` | GTK theme switcher |
| `dunst` | Notifications |

### Terminals
| Package | Purpose |
|---------|---------|
| `kitty` | Primary terminal (GPU-accelerated) |
| `konsole` | KDE terminal (for KDE users) |

### Launchers & Bars
| Package | Purpose |
|---------|---------|
| `rofi` | Application launcher |
| `polybar` | Status bar |

---

## 📦 Install Everything at Once

```bash
# Core packages
sudo pacman -S --needed --noconfirm \
    i3-wm i3-gaps i3status i3lock dmenu \
    picom nitrogen kitty rofi polybar \
    dunst lxappearance \
    ffmpeg mpv \
    libcaca libsixel \
    zsh zsh-completions \
    feh imagemagick \
    ranger thunar dolphin \
    htop btop \
    conky neofetch cmatrix \
    fortune-mod cowsay lolcat \
    wmctrl xdotool xclip \
    git curl wget \
    noto-fonts noto-fonts-emoji \
    ttf-nerd-fonts-symbols-mono \
    ttf-font-awesome \
    firefox chromium

# AUR packages
yay -S --needed --noconfirm cava
```

---

## 🎨 Fonts (Essential!)

| Package | Purpose |
|---------|---------|
| `noto-fonts` | Unicode font support |
| `noto-fonts-emoji` | Emoji rendering |
| `ttf-nerd-fonts-symbols-mono` | Icons and symbols |
| `ttf-font-awesome` | More icons |

---

## 🐚 Shell

| Package | Purpose |
|---------|---------|
| `zsh` | Better shell |
| `zsh-completions` | Tab completion |
| `bash` | Backup shell |

---

## 📁 File Managers

| Package | Purpose |
|---------|---------|
| `ranger` | Terminal file manager |
| `thunar` | GUI file manager |
| `dolphin` | KDE file manager |

---

## 🎬 Media

| Package | Purpose |
|---------|---------|
| `mpv` | Video player |
| `ffmpeg` | Video converter |
| `imagemagick` | Image tools |
| `libcaca` | ASCII video output |
| `libsixel` | Sixel graphics |

---

## 🎵 Fun Extras

| Package | Purpose |
|---------|---------|
| `cava` | Terminal audio visualizer (AUR) |
| `neofetch` | System info display |
| `cmatrix` | Matrix rain effect |
| `cowsay` | Talking cow |
| `fortune-mod` | Random quotes |
| `lolcat` | Rainbow text |

---

## 🌐 Browsers

| Package | Purpose |
|---------|---------|
| `firefox` | Main browser |
| `chromium` | Alternative |
| `tor-browser` | For privacy (AUR: `tor-browser`) |

---

## 🔧 Utilities

| Package | Purpose |
|---------|---------|
| `wmctrl` | Window control |
| `xdotool` | Simulate input |
| `xclip` | Clipboard access |
| `htop` | Process viewer |
| `btop` | Better process viewer |
| `conky` | System monitor |

---

## 📦 AUR Packages (via yay)

```bash
# Install yay first if not present
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay && makepkg -si

# Then install AUR packages
yay -S cava                    # Terminal audio visualizer
yay -S tor-browser            # Anonymous browsing
yay -S lightdm-webkit2-theme-glorious  # Pretty login theme
```

---

## 🔒 Privacy & Security

| Package | Purpose |
|---------|---------|
| `tor` | Tor proxy |
| `torsocks` | Tor wrapper |
| `proxychains-ng` | Proxy chains |

---

## 💋 Stay Filthy!

Your EndeavourOS system is now a complete depraved workstation! 🔥

**All packages installed with pacman/yay - No Debian/Tails compatibility needed!**