#!/bin/zsh

# ╔════════════════════╗
# ║    Set up Dock     ║
# ║    Preferences     ║
# ╚════════════════════╝                                             

echo -e "Setting Dock preferences...\n\n"

# System Preferences > Dock > Size:
echo "Setting dock size..."
defaults write com.apple.dock tilesize -int 40
echo -e "\tDock size set! \n"

# System Preferences > Dock > Magnification:
echo "Disabling dock magnification..."
defaults write com.apple.dock magnification -bool false
echo -e "\tDock magnification disabled! \n"

# System Preferences > Dock > Minimize windows using: Scale effect
echo "Minimize windows with 'scale' effect..."
defaults write com.apple.dock mineffect -string "scale"
echo -e "\tScale effect set! \n"

# System Preferences > Dock > Minimize windows into application icon
echo "Setting minimize into application icon behaviour..."
defaults write com.apple.dock minimize-to-application -bool true
echo -e "\tMinimize into application icon set! \n"

# Minimize windows using the hidden "Suck" effect
defaults write com.apple.dock mineffect -string suck;

# System Preferences > Dock > Automatically hide and show the Dock:
echo "Enabling dock auto-hide..."
defaults write com.apple.dock autohide -bool true
echo -e "\tDock auto-hide enabled! \n"

# System Preferences > Dock > Automatically hide and show the Dock (duration)
defaults write com.apple.dock autohide-time-modifier -float 0.5

# System Preferences > Dock > Automatically hide and show the Dock (delay)
defaults write com.apple.dock autohide-delay -float 0

# System Preferences > Dock > Show indicators for open applications
echo "Enabling indicators for open applications..."
defaults write com.apple.dock show-process-indicators -bool true
echo -e "\tOpen application indicators enabled! \n"

# System Preferences > Dock > Remove Recently Opened Applications
echo "Removing recent applications in dock..."
defaults write com.apple.dock show-recents -int 0
echo -e "\tRecent applications will not be shown in dock! \n"

echo "Restarting dock to apply preferences..."
killall "Dock" > /dev/null 2>&1
