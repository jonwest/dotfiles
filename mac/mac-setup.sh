#!/bin/zsh

include() {
  [[ -f "$1" ]] && source "$1" || echo "ERROR loading ${1}"
}



#######

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

include "${DOTFILES}/../mac/input-preferences.sh"
include "${DOTFILES}/../mac/finder-preferences.sh"
include "${DOTFILES}/../mac/dock-preferences.sh"
include "${DOTFILES}/../mac/dock-remove-bloat.sh"
include "${DOTFILES}/../mac/misc-preferences.sh"
