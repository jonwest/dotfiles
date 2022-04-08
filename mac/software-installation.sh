#!/bin/zsh

# ╔════════════════════╗
# ║   Install macOS    ║
# ║      Software      ║
# ╚════════════════════╝

# Install Homebrew
if [[ ! $(which brew) ]]; then
  echo -e "Homebrew not installed, installing now..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Homebrew packages
if [[ ! "$(brew bundle check --file=${DOTFILES_INSTALLER}/homebrew/Brewfile)" ]]; then
  echo -e "Installing Homebrew packages... \n\n"
  brew bundle --file=${DOTFILES_INSTALLER}/homebrew/Brewfile &&\
  brew cleanup
fi

# Install Mac App Store packages
#   Relies on 'mas', installed via Homebrew in the previous step
if [[ $(which brew) ]]; then
  if [[ $(mas list | grep 1451685025 | wc -l) -eq 0 ]]; then
    echo "Installing Wireguard VPN..."
    mas install 1451685025
  fi
fi
