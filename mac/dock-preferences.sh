#!/bin/zsh

#                              _            _            
#   _ __ ___   __ _  ___    __| | ___   ___| | __        
#  | '_ ` _ \ / _` |/ __|  / _` |/ _ \ / __| |/ /        
#  | | | | | | (_| | (__  | (_| | (_) | (__|   <         
#  |_| |_| |_|\__,_|\___|  \__,_|\___/ \___|_|\_\        
#                   __                                   
#   _ __  _ __ ___ / _| ___ _ __ ___ _ __   ___ ___  ___ 
#  | '_ \| '__/ _ \ |_ / _ \ '__/ _ \ '_ \ / __/ _ \/ __|
#  | |_) | | |  __/  _|  __/ | |  __/ | | | (_|  __/\__ \
#  | .__/|_|  \___|_|  \___|_|  \___|_| |_|\___\___||___/
#  |_|                                                   

echo "Setting Dock preferences...\n\n"

# System Preferences > Dock > Size:
echo "Setting dock size..."
defaults write com.apple.dock tilesize -int 40
echo "Dock size set!"

# System Preferences > Dock > Magnification:
echo "Disabling dock magnification..."
defaults write com.apple.dock magnification -bool false
echo "Dock magnification disabled!"

# System Preferences > Dock > Minimize windows using: Scale effect
echo "Minimize windows with 'scale' effect..."
defaults write com.apple.dock mineffect -string "scale"
echo "Scale effect set!"

# System Preferences > Dock > Minimize windows into application icon
echo "Setting minimize into application icon behaviour..."
defaults write com.apple.dock minimize-to-application -bool true
echo "Minimize into application icon set!"

# System Preferences > Dock > Automatically hide and show the Dock:
echo "Enabling dock auto-hide..."
defaults write com.apple.dock autohide -bool true
echo "Dock auto-hide enabled!"

# System Preferences > Dock > Automatically hide and show the Dock (duration)
defaults write com.apple.dock autohide-time-modifier -float 0.5

# System Preferences > Dock > Automatically hide and show the Dock (delay)
defaults write com.apple.dock autohide-delay -float 0

# System Preferences > Dock > Show indicators for open applications
echo "Enabling indicators for open applications..."
defaults write com.apple.dock show-process-indicators -bool true
echo "Open application indicators enabled!"

# System Preferences > Dock > Remove Recently Opened Applications
echo "Removing recent applications in dock..."
defaults write com.apple.dock show-recents -int 0
echo "Recent applications will not be shown in dock!"

echo "Restarting dock to apply preferences..."
killall "Dock" > /dev/null 2>&1
