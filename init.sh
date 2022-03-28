#!/bin/bash

# Require starship
if [[ ! $(which starship) ]]; then
  curl -sS https://starship.rs/install.sh | sh
fi

# Set up NvChad if Neovim is available
if [[ $(which nvim) ]]; then
  nvim -c 'hi NormalFloat guibg=#1e222a' -c PackerSync -c "qa!"
fi
