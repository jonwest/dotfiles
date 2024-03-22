#!/bin/bash
TRACE="${TRACE:-0}";
set -o errexit;
set -o nounset;
set -o pipefail;
if [[ -n "${TRACE}" && "${TRACE}" -ge 2 ]]; then set -o xtrace; fi

export DOTFILES_INSTALLER="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";

# Require starship
if ! command -v starship >/dev/null 2>&1; then
  read -p "'starship' is not installed.  Would you like to install it? [y/N]" -n 1 -r;
echo;
  if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y;
  else
    echo "Confirmation rejected.  'starship' will not be installed.";
  fi
  
fi

# Install lazygit
if ! command -v lazygit >/dev/null 2>&1; then
  read -rp "'lazygit' is not installed.  Would you like to install it? [y/N]" -n 1 -r;
echo;
  if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*');
    cd /tmp;
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_$(uname)_$(uname -m).tar.gz";
    tar xf lazygit.tar.gz lazygit;
    mv lazygit "${HOME}/bin/lazygit";
    cd -;
  else
    echo "Confirmation rejected.  'lazygit' will not be installed.";
  fi
fi


# Set up NvChad if Neovim is available
if command -v nvim >/dev/null 2>&1 && ! [[ -d "${HOME}/.config/nvim" ]]; then
  read -rp "'NVChad' (neovim defaults) is not installed.  Would you like to install it? [y/N]" -n 1 -r; echo;

  if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
    git clone https://github.com/NvChad/starter "${HOME}/.config/nvim";
    nvim -c 'MasonInstallAll' -c "qa!";
    rm -rf "${HOME}/.config/nvim/.git";
  else
    echo "Confirmation rejected.  'NVChad' will not be installed.";
  fi
fi

# Configure macOS preferences
if [[ $(uname) = Darwin ]]; then
  read -rp "Would you like to run Mac preferences setup? [y/N]" -n 1 -r;
echo;
  if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
    source ./mac/mac-setup.sh;
  else
    echo "Confirmation rejected.  Mac Preferences will remain as-is.";
  fi

fi

unset DOTFILES_INSTALLER
