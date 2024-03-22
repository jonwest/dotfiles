#!/bin/zsh

# ╔════════════════════╗
# ║ Remove Dock Bloat  ║
# ╚════════════════════╝

apps_to_remove=(
    'Siri'
    'Launchpad'
    'Mail'
    'Safari'
    'Contacts'
    'Notes'
    'Reminders'
    'Maps'
    'Photos'
    'Messages'
    'FaceTime'
    'Pages'
    'Podcasts'
    'TV'
    'Numbers'
    'Keynote'
    'News'
    'Music'
    'App Store'
    'System Preferences'
)

if ! [[ $(command -v dockutil) ]]; then 
  echo "dockutil not installed, cannot remove dock bloat."
  echo "Install from: https://github.com/kcrawford/dockutil/releases"
fi

echo "Removing default bloat apps from dock..."
for app in "${apps_to_remove[@]}"; do
  [[ $(dockutil --find "${app}" | grep "not found") ]] || eval "dockutil --remove ${app} --no-restart"
done

echo "Restarting dock..."
killall "Dock" > /dev/null 2>&1


