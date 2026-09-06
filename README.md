# dotfile-cachyos

Dotfiles personal untuk CachyOS + Hyprland dengan [Caelestia Shell](https://github.com/caelestia-dots/shell).

## Struktur

```
my-dotfiles/
├── caelestia/     → ~/.config/caelestia/   (kustomisasi shell & hyprland)
├── fish/          → ~/.config/fish/         (shell config)
├── kitty/         → ~/.config/kitty/        (terminal)
├── nvim/          → ~/.config/nvim/         (editor)
└── starship/      → ~/.config/starship.toml (prompt)
```

Semua file di `~/.config` adalah **symlink** ke repo ini via GNU Stow.

---

## Setup di mesin baru

```bash
# 1. Clone repo
git clone git@github.com:RamliZhafran/dotfile-cachyos.git ~/my-dotfiles
cd ~/my-dotfiles

# 2. Stow semua package
stow --target ~/.config/caelestia caelestia
stow --target ~/.config/fish      fish
stow --target ~/.config/kitty     kitty
stow --target ~/.config/nvim      nvim
stow --target ~/.config           starship
```

---

## Kustomisasi

### Caelestia Shell — UI bar, OSD, dashboard

Edit `caelestia/shell.json`:

```json
{
  "bar": {
    "statusIcons": [
      { "id": "battery",   "enabled": true },
      { "id": "network",   "enabled": true },
      { "id": "bluetooth", "enabled": true }
    ]
  },
  "general": {
    "apps": {
      "terminal": ["kitty"]
    }
  }
}
```

Untuk override per monitor, edit `caelestia/monitors/eDP-1/shell.json`.

---

### Hyprland — variabel (gap, opacity, keybind, app default)

Edit `caelestia/hypr-vars.lua`, contoh:

```lua
return {
    terminal      = "kitty",
    browser       = "firefox",
    windowOpacity = 0.90,
    windowRounding = 12,
    workspaceGaps  = 16,

    -- Keybind
    kbTerminal = "SUPER + T",
    kbBrowser  = "SUPER + W",
}
```

Semua variabel yang bisa di-override ada di:
`~/.local/state/caelestia/dots/hypr/variables.lua`

---

### Hyprland — tambah rule / bind kustom

Edit `caelestia/hypr-user.lua`, file ini di-load paling terakhir:

```lua
-- Contoh: bind kustom
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd("thunar"))

-- Contoh: window rule
hl.window_rule({ match = { class = "obsidian" }, float = true })
```

---

### Fish shell — alias & env kustom

Edit `caelestia/user-config.fish`:

```fish
# Alias tambahan
alias vim 'nvim'
alias cat 'bat'

# Env
set -gx EDITOR nvim
```

---

### Color scheme

Ganti skema warna via CLI:

```bash
# Lihat skema yang tersedia
caelestia scheme list

# Set skema
caelestia scheme set -n caelestia   # default bawaan
caelestia scheme set -w             # generate dari wallpaper aktif
```

Skema aktif tersimpan di `~/.local/state/caelestia/scheme.json`.

---

## Tambah package stow baru

```bash
mkdir -p ~/my-dotfiles/<nama>/
cp ~/.config/<nama>/<file> ~/my-dotfiles/<nama>/
rm ~/.config/<nama>/<file>
stow --target ~/.config/<nama> <nama>

git add . && git commit -m "add <nama> dotfiles" && git push
```

---

## Dokumentasi

| Topik | Link |
|---|---|
| Caelestia Shell | https://github.com/caelestia-dots/shell |
| Caelestia CLI | https://github.com/caelestia-dots/cli |
| Caelestia Dots (upstream) | https://github.com/caelestia-dots/dots |
| Hyprland | https://wiki.hyprland.org |
| Hyprland Lua API | https://wiki.hyprland.org/Configuring/Lua-config |
| GNU Stow | https://www.gnu.org/software/stow/manual |
| Fish shell | https://fishshell.com/docs/current |
| Starship prompt | https://starship.rs/config |
| Kitty terminal | https://sw.kovidgoyal.net/kitty/conf |
