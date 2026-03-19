# 🍆💦 QUICK START GUIDE 💋🔥

Get your slutty Tails desktop running in 60 seconds!

---

## ⚡ ONE-TIME SETUP

```bash
# 1. Navigate to the TailsSlutDesktop folder
cd ~/TailsSlutDesktop

# 2. Run the setup script
./scripts/setup.sh

# 3. Done! Your desktop shortcuts are ready.
```

---

## 🎭 SWITCHING MODES

### Method 1: Desktop Shortcuts (Easiest)
Just double-click on your Desktop:
- 🔥-DEGENERATE-MODE - Maximum filth
- 💦-HORNY-MODE - Sensual vibes  
- ✨-NORMAL-MODE - Clean & professional

### Method 2: Terminal Commands
```bash
# DEGENERATE MODE - Explicit wallpaper, adult sites, 85% transparency
./scripts/mode-switcher.sh degenerate

# HORNY MODE - Sexy theme, 70% transparency
./scripts/mode-switcher.sh horny

# NORMAL MODE - Clean Tails defaults
./scripts/mode-switcher.sh normal
```

---

## 📂 WHAT'S INCLUDED

| Feature | Degenerate | Horny | Normal |
|---------|-----------|-------|--------|
| Wallpaper | Explicit image 🔥 | Sexy theme 💦 | Default ✨ |
| Transparency | 85% | 70% | 0% |
| Adult Links | Yes (17 sites) | No | No |
| Color Scheme | Deep pink/purple | Rose/coral | Default |
| Terminal Style | Cum-stained 🍆 | Flirty 💋 | Clean |

---

## 🔗 ADULT SITES IN DEGENERATE MODE

When you activate Degenerate Mode, these sites appear on your desktop:

**Mainstream (8 sites):**
Pornhub, Xvideos, Xnxx, Redtube, Youporn, Tube8, Spankbang, xHamster

**Cam/OnlyFans (6 sites):**
Chaturbate, CamSoda, Stripchat, BongaCams, MyFreeCams, JerkMate

**Hentai/Rule34 (6 sites):**
Hentai Haven, Rule34, E621, Gelbooru, Danbooru, E-Hentai, ExHentai, Luscious

---

## 💻 TERMINAL CUSTOMIZATION

Add slutty prompts to your shell:

**For Bash:**
```bash
# Add to ~/.bashrc:
echo "source ~/TailsSlutDesktop/terminal-themes/degenerate-bash-prompt.sh" >> ~/.bashrc
# Or for horny mode:
echo "source ~/TailsSlutDesktop/terminal-themes/horny-bash-prompt.sh" >> ~/.bashrc
```

**For Zsh:**
```bash
# Add to ~/.zshrc:
echo "source ~/TailsSlutDesktop/terminal-themes/degenerate-zsh-prompt.zsh" >> ~/.zshrc
```

---

## 🎨 CUSTOMIZATION

### Change Transparency Level
Edit the GTK theme files in `themes/`:
- Look for `alpha(@color, 0.85)` values
- 0.85 = 85% opaque (15% transparent)
- 0.70 = 70% opaque (30% transparent)

### Change Colors
Edit the CSS variables at the top of each theme file:
- `@define-color degenerate-bg` - Background
- `@define-color degenerate-fg` - Foreground
- `@define-color degenerate-accent` - Accents

### Add More Sites
Edit `scripts/mode-switcher.sh` and add more `.desktop` entries in the `create_adult_shortcuts` function.

---

## 🛠️ TROUBLESHOOTING

| Issue | Solution |
|-------|----------|
| Transparency not working | Tails uses GNOME's compositor - should work by default |
| Scripts won't run | Run `chmod +x scripts/*.sh` |
| Colors look wrong | Make sure GTK CSS files are in `~/.config/gtk-3.0/` |
| Wallpaper doesn't change | Check that `degenerate_wallpaper.jpg` exists in `wallpapers/` |

---

## 🔒 PERSISTENCE ON TAILS

To keep your slutty desktop across reboots:

1. Copy `TailsSlutDesktop` to your **Tails persistent storage**
2. Enable "Personal Data" persistence
3. The desktop shortcuts and themes will persist!

---

*Stay filthy, slut! 🍆💦💋🔥*
