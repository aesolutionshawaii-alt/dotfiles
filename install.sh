#!/bin/bash
# Dotfiles Installation Script
# Run this on a new machine or after pulling updates

set -e

DOTFILES="$HOME/.dotfiles"

echo "Installing dotfiles..."

# Create ~/bin symlink
if [ -L "$HOME/bin" ]; then
  rm "$HOME/bin"
fi
if [ -d "$HOME/bin" ]; then
  echo "Warning: ~/bin exists as directory. Backing up to ~/bin.backup"
  mv "$HOME/bin" "$HOME/bin.backup"
fi
ln -sf "$DOTFILES/bin" "$HOME/bin"
echo "  ✓ ~/bin -> $DOTFILES/bin"

# Symlink .zshrc
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
  echo "  Backing up existing .zshrc to .zshrc.backup"
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi
ln -sf "$DOTFILES/zshrc" "$HOME/.zshrc"
echo "  ✓ ~/.zshrc -> $DOTFILES/zshrc"

# Symlink .aliases
if [ -f "$HOME/.aliases" ] && [ ! -L "$HOME/.aliases" ]; then
  mv "$HOME/.aliases" "$HOME/.aliases.backup"
fi
ln -sf "$DOTFILES/aliases" "$HOME/.aliases"
echo "  ✓ ~/.aliases -> $DOTFILES/aliases"

# Install Node dependencies (for webimg)
if [ -f "$DOTFILES/package.json" ]; then
  echo "  Installing Node dependencies..."
  cd "$DOTFILES" && npm install --silent
  echo "  ✓ Node dependencies installed"
fi

echo ""
echo "Installation complete!"
echo ""
echo "To apply changes, run: source ~/.zshrc"
echo ""
echo "To sync between machines:"
echo "  1. Push from this machine:  dotfiles-sync"
echo "  2. Pull on other machine:   dotfiles-pull"
