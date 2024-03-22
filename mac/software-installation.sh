#!/bin/zsh

# ╔════════════════════╗
# ║   Install macOS    ║
# ║      Software      ║
# ╚════════════════════╝

# Install Homebrew
if [[ ! $(which brew) ]]; then
  read -rp "'homebrew' is not installed.  Would you like to install it? [y/N]" -n 1 -r; echo;

  if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
  else
    echo "Confirmation rejected.  'homebrew' will not be installed.";
  fi
fi

# Install Homebrew packages
if [[ ! "$(brew bundle check --file=${DOTFILES_INSTALLER}/homebrew/Brewfile)" ]]; then
  read -rp "There are packages not installed from your Brewfile. Would you like to install them? [y/N]" -n 1 -r; echo;
  
  if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
    brew bundle --file=${DOTFILES_INSTALLER}/homebrew/Brewfile &&\
    brew cleanup
  else
    echo "Confirmation rejected.  Homebrew packages will not be installed.";
  fi
fi

if ! [[ $(which dockutil) ]]; then
  read -rp "'dockutil' is not installed.  It's used to manage dock bloat.  Would you like to install it? [y/N]" -n 1 -r; echo;

  if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
    # Get the latest release of dockutil
    LATEST_URL="https://github.com/kcrawford/dockutil/releases/latest";
    TAG=$(curl -Ls -o /dev/null -w %{url_effective} $LATEST_URL | grep -oE 'tag\/(.+)$' | sed 's/tag\///');
    wget -O ~/Downloads/dockutil.pkg "https://github.com/kcrawford/dockutil/releases/download/${TAG}/dockutil-${TAG}.pkg";

    sudo installer -pkg ~/Downloads/dockutil.pkg -target /;
  else
    echo "Confirmation rejected.  'dockutil' will not be installed.";
  fi
fi
