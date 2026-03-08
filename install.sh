#!/bin/bash
set -e

DOTFILES="$HOME/dotfiles"

mkdir -p ~/.config/nvim
ln -sf "$DOTFILES/nvim/init.lua" ~/.config/nvim/init.lua

echo "Done! Open nvim and run :Lazy sync"
