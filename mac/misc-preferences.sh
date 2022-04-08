#!/bin/zsh

# ╔════════════════════╗
# ║ Set Miscellaneous  ║
# ║    Preferences     ║
# ╚════════════════════╝

# Disable personalized ads
defaults write NSGlobalDomain com.apple.AdLib.allowApplePersonalizedAdvertising -int 0;

# Disable spotlight search keyboard shortcut
defaults write NSGlobalDomain com.apple.symbolichotkeys.AppleSymbolicHotKeys.64.enabled -int 0;

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
