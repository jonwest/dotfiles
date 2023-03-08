#!/bin/zsh

# ╔════════════════════╗
# ║  Set Input Device  ║
# ║    Preferences     ║
# ╚════════════════════╝                                                

echo -e "Setting input device preferences...\n\n"

# ┌───────────────────────────┐
# │   Set Trackpad Settings   │
# └───────────────────────────┘
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

# ┌───────────────────────────┐
# │    Set Mouse Settings     │
# └───────────────────────────┘
echo "Setting mouse tracking speed..."
defaults write com.apple.mouse.scaling -float 3
echo -e "\tMouse tracking speed set! \n"


# ┌───────────────────────────┐
# │   Set Keyboard Settings   │
# └───────────────────────────┘
echo "Disabling press-and-hold for keys in favor of key repeat..."
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
echo -e "\tKey repeat enabled! \n"

echo "Setting key repeat..."
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
echo -e "\tKey repeat set! \n"

echo "Disabling period after two spaces..."
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -int 0
echo -e "\tAutomatic period disabled! \n"

echo "Disabling automatic capitalization..."
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -int 0
echo -e "\tAutomatic period disabled! \n"

echo "Disabling automatic spellcheck..."
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -int 0
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -int 0
echo -e "\tAutomatic period disabled! \n"
