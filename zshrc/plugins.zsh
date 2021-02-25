###
# PLUGINS
###
source $HOME/.zplug/init.zsh;
zplug "lukechilds/zsh-nvm"                          # Lazy Load nvm
zplug "mroth/evalcache"                             # Lazy load rbenv
zplug "nyquase/vi-mode"                             # Prefer vi mode
zplug "zsh-users/zsh-autosuggestions"               # Use fish style autosuggestions
zplug "zsh-users/zsh-completions"                   # Add tab completion
zplug "zdharma/fast-syntax-highlighting", defer:2   # Speed that up
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "romkatv/powerlevel10k", as:theme, depth:1    # Prefer powerline10k theme
zplug load
