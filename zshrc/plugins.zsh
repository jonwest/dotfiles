####
## PLUGINS
####
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

zinit light "lukechilds/zsh-nvm"                          # Lazy Load nvm
zinit light "mroth/evalcache"                             # Lazy load rbenv
zinit light "zsh-users/zsh-autosuggestions"               # Use fish style autosuggestions
zinit light "zsh-users/zsh-completions"                   # Add tab completion
zinit light "zdharma-continuum/fast-syntax-highlighting"  # Speed that up
zinit ice depth=1; zinit light "romkatv/powerlevel10k"    # Prefer powerline10k theme


####
## AUTOSUGGESTIONS
####
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
