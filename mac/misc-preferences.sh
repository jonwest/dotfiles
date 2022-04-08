#!/bin/zsh

# ╔════════════════════╗
# ║ Set Miscellaneous  ║
# ║    Preferences     ║
# ╚════════════════════╝

# Disable personalized ads
defaults write NSGlobalDomain com.apple.AdLib.allowApplePersonalizedAdvertising -int 0;

# Disable spotlight search keyboard shortcut
defaults write NSGlobalDomain com.apple.symbolichotkeys.AppleSymbolicHotKeys.64.enabled -int 0;
