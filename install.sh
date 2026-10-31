#!/usr/bin/env bash
# Simple installer for dotfiles
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

backup() {
  [ -e "$2" ] && [ ! -L "$2" ] && mv "$2" "$2.bak.$(date +%s)"
}

# Shell
backup ~/.bashrc ~/.bashrc && ln -sf "$DOTFILES_DIR/shell/bashrc" ~/.bashrc
backup ~/.bash_profile ~/.bash_profile && ln -sf "$DOTFILES_DIR/shell/bash_profile" ~/.bash_profile
backup ~/.profile ~/.profile && ln -sf "$DOTFILES_DIR/shell/profile" ~/.profile
[ -f "$DOTFILES_DIR/shell/zshrc" ] && (backup ~/.zshrc ~/.zshrc && ln -sf "$DOTFILES_DIR/shell/zshrc" ~/.zshrc)

# Git
[ -f "$DOTFILES_DIR/git/gitconfig" ] && (backup ~/.gitconfig ~/.gitconfig && ln -sf "$DOTFILES_DIR/git/gitconfig" ~/.gitconfig)

# Stow style configs
mkdir -p ~/.config
for d in config/*; do
  [ -d "$d" ] || continue
  name=$(basename "$d")
  backup ~/.config/"$name" ~/.config/"$name" && ln -sf "$DOTFILES_DIR/config/$name" ~/.config/"$name"
done

echo "Done! Check ~/.config for symlinks."
