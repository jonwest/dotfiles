#!/bin/bash

# Change to zsh if available
if [[ ! $(echo $SHELL | awk '/zsh/') ]]; then
  echo "Shell is not set to ZSH"
  if [[ $(which zsh) ]]; then
    chsh -s $(which zsh) $(whoami) &&\
    echo "Shell has been set to zsh";
  else
    echo "zsh is not present, cannot change shell."
  fi
fi

# Set up Tmux plugins
if [[ $(which tmux) ]]; then
  . ${HOME}/.tmux/plugins/tpm/bin/install_plugins
fi

# Set up NvChad if Neovim is available
if [[ $(which nvim) ]]; then
  nvim -c 'hi NormalFloat guibg=#1e222a' -c PackerSync -c "qa!"
fi
