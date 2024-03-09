#!/bin/bash

export DOTFILES_INSTALLER="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Require starship
if ! command -v starship >/dev/null 2>&1; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Install lazygit
if ! command -v lazygit >/dev/null 2>&1; then
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  pushd /tmp || echo "/tmp doesn't exist" && exit 1;
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_$(uname)_$(uname -m).tar.gz";
  tar xf lazygit.tar.gz lazygit;
  mv lazygit "${HOME}/bin/lazygit";
fi


# Set up NvChad if Neovim is available
if [[ $(which nvim) ]]; then
  nvim -c 'hi NormalFloat guibg=#1e222a' -c PackerSync -c "qa!"
fi

# Configure macOS preferences
[[ $(uname) = Darwin ]] && source ./mac/mac-setup.sh

unset DOTFILES_INSTALLER


