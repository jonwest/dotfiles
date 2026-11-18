#!/usr/bin/env bash
set -euo pipefail

# If /etc/os-release isn't present, it's for sure not running cachyos
# so the rest of the script is wholly irrelevant
if [ ! -f /etc/os-release ]; then
  echo "Not running CachyOS"
  exit 0
fi


if grep -qi cachyos /etc/os-release; then
  sudo pacman -S --noconfirm --needed paru

  packages=(
    docker
    git
    kio-extras
    lutris
    neovim
    p7zip
    ripgrep
    sshfs
    starship
    visual-studio-code-bin
    wl-clipboard
  )

  paru -S --needed --noconfirm "${packages[@]}"
fi
