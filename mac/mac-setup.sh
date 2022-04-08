#!/bin/zsh

#  ███╗   ███╗ █████╗  ██████╗ ██████╗ ███████╗
#  ████╗ ████║██╔══██╗██╔════╝██╔═══██╗██╔════╝
#  ██╔████╔██║███████║██║     ██║   ██║███████╗
#  ██║╚██╔╝██║██╔══██║██║     ██║   ██║╚════██║
#  ██║ ╚═╝ ██║██║  ██║╚██████╗╚██████╔╝███████║
#  ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
#  ███████╗███████╗████████╗██╗   ██╗██████╗   
#  ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗  
#  ███████╗█████╗     ██║   ██║   ██║██████╔╝  
#  ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝   
#  ███████║███████╗   ██║   ╚██████╔╝██║       
#  ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝       
#                                              


# Fail fast
set -euo pipefail

include() {
  [[ -f "$1" ]] && source "$1" || echo "ERROR loading ${1}"
}

# If this is run directly, and not through the installer, DOTFILES_FOLDER won't be set,
# so use the DOTFILES_INSTALLER variable in its place.
[[ -z ${DOTFILES_INSTALLER+x} ]] && DOTFILES_INSTALLER=${DOTFILES_FOLDER}

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

include "${DOTFILES_INSTALLER}/mac/input-preferences.sh"
include "${DOTFILES_INSTALLER}/mac/finder-preferences.sh"
include "${DOTFILES_INSTALLER}/mac/dock-preferences.sh"
include "${DOTFILES_INSTALLER}/mac/misc-preferences.sh"
include "${DOTFILES_INSTALLER}/mac/software-installation.sh"
include "${DOTFILES_INSTALLER}/mac/dock-remove-bloat.sh"

# Unset failing fast
set +euo pipefail
