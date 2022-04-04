#!/bin/zsh

#    __ _           _                                    
#   / _(_)_ __   __| | ___ _ __                          
#  | |_| | '_ \ / _` |/ _ \ '__|                         
#  |  _| | | | | (_| |  __/ |                            
#  |_| |_|_| |_|\__,_|\___|_|                            
#                   __                                   
#   _ __  _ __ ___ / _| ___ _ __ ___ _ __   ___ ___  ___ 
#  | '_ \| '__/ _ \ |_ / _ \ '__/ _ \ '_ \ / __/ _ \/ __|
#  | |_) | | |  __/  _|  __/ | |  __/ | | | (_|  __/\__ \
#  | .__/|_|  \___|_|  \___|_|  \___|_| |_|\___\___||___/
#  |_|                                                   

echo "Setting up Finder preferences...\n\n"

echo "Enable always showing the status bar..."
defaults write com.apple.finder ShowStatusBar -bool true

echo "Enable always showing the path bar..."
defaults write com.apple.finder ShowPathbar -bool true

echo "Setting 'Display full POSIX path as Finder window title'..."
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "Setting 'Keep folders on top when sorting by name'..."
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo "Setting 'Search the current folder by default'..."
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Disabling the warning when changing a file extension..."
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Avoid creating .DS_Store files on network or USB volumes..."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Setting 'Use list view in all Finder windows by default'..."
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo "Setting 'Expand save panel by default'..."
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
