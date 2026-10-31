# dotfile-cachyos

Backup dotfiles buat CachyOS/Hyprland setup aku.

## Struktur
- `shell/` - bashrc, bash_profile, profile, zshrc
- `git/` - gitconfig
- `config/` - isi `.config/` (hyprland, waybar, etc)
- `nvim/`, `fish/`, `starship/`, `caelestia/`, `kitty/` - apps spesifik
- `.gitignore` - skip file sensitif & cache

## Cara restore
Gunakan GNU Stow:
```bash
git clone git@github.com:RamliZhafran/dotfile-cachyos.git ~/dotfiles
cd ~/dotfiles
stow */
```

Atau pakai `./install.sh`:
```bash
./install.sh
```

## Catatan
- Jangan push SSH private key, token, atau history
- `.gitignore` udah disetup buat hal itu
