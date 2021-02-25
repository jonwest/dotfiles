###
# PLUGINS
###
source $HOME/.zplug/init.zsh;
zplug "lukechilds/zsh-nvm"                          # Lazy Load nvm
zplug "mroth/evalcache"                             # Lazy load rbenv
zplug "zsh-users/zsh-autosuggestions"               # Use fish style autosuggestions
zplug "zsh-users/zsh-completions"                   # Add tab completion
zplug "zdharma/fast-syntax-highlighting", defer:2   # Speed that up
zplug "romkatv/powerlevel10k", as:theme, depth:1    # Prefer powerline10k theme
zplug load
