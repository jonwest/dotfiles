#!/bin/bash

export DOTFILES_INSTALLER="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Require starship
if [[ ! $(which starship) ]]; then
  curl -sS https://starship.rs/install.sh | sh
fi

# Set up NvChad if Neovim is available
if [[ $(which nvim) ]]; then
  nvim -c 'hi NormalFloat guibg=#1e222a' -c PackerSync -c "qa!"
fi

# Configure macOS preferences
[[ $(uname) = Darwin ]] && source ./mac/mac-setup.sh

unset DOTFILES_INSTALLER


