#!/bin/bash

# If this is dev container without zsh, attempt to install it
if [[ ${REMOTE_CONTAINERS} ]]; then
  if [[ ! $(which zsh) && $(which apt-get) ]]; then
    sudo apt-get update -qq &&\
    sudo apt-get install -yqq \
      zsh
  fi
fi


# Change to zsh if available
if [[ ! $(echo $SHELL | awk '/zsh/') ]]; then
  echo "Shell is not set to ZSH"
  if [[ $(which zsh) ]]; then
    if [[ ${REMOTE_CONTAINERS} ]]; then
      # Use sudo to chsh since we won't know the user password in a container
      sudo chsh -s $(which zsh) $(whoami)
    else 
      chsh -s $(which zsh) $(whoami)
    fi

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
