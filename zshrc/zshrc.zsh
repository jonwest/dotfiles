#             _              
#     _______| |__  _ __ ___ 
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__ 
#  (_)___|___/_| |_|_|  \___|
# -----------------------------
zmodload zsh/zprof
export DOTFILES="$HOME/Customization/dotfiles/zshrc"
export KITTY_CONFIG_DIRECTORY="$HOME/Customization/dotfiles/kitty"

####
## HELPERS
####
include() {
    [[ -f "$1" ]] && source "$1" || echo "ERROR loading ${1}"
}

bindkey -v  # Use vi-mode

autoload -Uz compinit
[[ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]] && compinit || compinit -C
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'


####
## SYSTEM SETUP
####
export LANG=en_US.UTF-8
export EDITOR='nvim'

include $DOTFILES/development_env.zsh #  Development environment configuration
include $DOTFILES/plugins.zsh         #  zsh plugins via zplug
include $DOTFILES/development.zsh     #  Development helpers
include $DOTFILES/thinkific.zsh       #  Thinkific specific helpers
include $DOTFILES/p10k.zsh            #  Powerlevel10k configuration
include $DOTFILES/tmux.zsh            #  Create or attach to a tmux session on start
include $DOTFILES/aliases.zsh         #  Convenience aliases
include $HOME/.zshsecrets             #  Sensitive material that shouldn't be in version control

####
## PREFERENCE
####
autoload zmv

# Match oh-my-zsh history searching
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
