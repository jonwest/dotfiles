#!/bin/zsh

# ╔════════════════════╗
# ║     Set Finder     ║
# ║    Preferences     ║
# ╚════════════════════╝                                             

echo -e "Setting up Finder preferences...\n\n"

echo "Enable always showing the status bar..."
defaults write com.apple.finder ShowStatusBar -bool true
echo -e "\tFinder status bar always visible!\n"

echo "Enable always showing the path bar..."
defaults write com.apple.finder ShowPathbar -bool true
echo -e "\tPath bar always visible!\n"

echo "Setting 'Display full POSIX path as Finder window title'..."
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
echo -e "\tWindow title set to full POSIX path!\n"

echo "Setting 'Keep folders on top when sorting by name'..."
defaults write com.apple.finder _FXSortFoldersFirst -bool true
echo -e "\tFolders displayed on top set!\n"

echo "Setting 'Search the current folder by default'..."
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
echo -e "\tSearch current folder set to default!\n"

echo "Disabling the warning when changing a file extension..."
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
echo -e "\tExtension changing warning disabled!\n"

echo "Avoid creating .DS_Store files on network or USB volumes..."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Setting 'Use list view in all Finder windows by default'..."
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
echo -e "\tList view set to default!\n"

echo "Setting 'Expand save panel by default'..."
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
echo -e "\tSave panel will expand by default!\n"

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
