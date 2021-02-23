#         _             _           
#   _ __ | |_   _  __ _(_)_ __  ___ 
#  | '_ \| | | | |/ _` | | '_ \/ __|
#  | |_) | | |_| | (_| | | | | \__ \
#  | .__/|_|\__,_|\__, |_|_| |_|___/
#  |_|            |___/             

[[ -d "$HOME/.zplug" && -f "$HOME/.zplug/init.zsh" ]] && source "$HOME/.zplug/init.zsh"

# Plugins
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/osx",   from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "romkatv/powerlevel10k", as:theme, depth:1

zplug load
