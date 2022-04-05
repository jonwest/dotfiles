#!/bin/zsh

#   _                   _                                
#  (_)_ __  _ __  _   _| |_                              
#  | | '_ \| '_ \| | | | __|                             
#  | | | | | |_) | |_| | |_                              
#  |_|_| |_| .__/ \__,_|\__|                             
#          |_|      __                                   
#   _ __  _ __ ___ / _| ___ _ __ ___ _ __   ___ ___  ___ 
#  | '_ \| '__/ _ \ |_ / _ \ '__/ _ \ '_ \ / __/ _ \/ __|
#  | |_) | | |  __/  _|  __/ | |  __/ | | | (_|  __/\__ \
#  | .__/|_|  \___|_|  \___|_|  \___|_| |_|\___\___||___/
#  |_|                                                   

echo -e "Setting input device preferences...\n\n"

####
## Trackpad
####
echo "Enabling tap to click for this user and for the login screen..."
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
echo -e "\tTap to click enabled! \n"

echo "Enabling force click..."
defaults write com.apple.trackpad.forceClick -bool true
echo -e "\tForce click enabled! \n"

echo "Setting trackpad tracking speed..."
defaults write com.apple.trackpad.scaling -float 2.5
echo -e "\tTrackpad speed set! \n"

####
## Mouse
####
echo "Setting mouse tracking speed..."
defaults write com.apple.mouse.scaling -float 3
echo -e "\tMouse tracking speed set! \n"


####
## Keyboard
####
echo "Disabling press-and-hold for keys in favor of key repeat..."
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
echo -e "\tKey repeat enabled! \n"

echo "Setting key repeat..."
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
echo -e "\tKey repeat set! \n"
