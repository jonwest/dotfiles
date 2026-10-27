#!/usr/bin/env bash
set -euo pipefail

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
