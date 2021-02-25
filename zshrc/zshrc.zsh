#             _              
#     _______| |__  _ __ ___ 
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__ 
#  (_)___|___/_| |_|_|  \___|
# -----------------------------

export DOTFILES="$HOME/Customization/dotfiles/zshrc"
export KITTY_CONFIG_DIRECTORY="$HOME/Customization/dotfiles/kitty"

###
# HELPERS
###
include() {
    [[ -f "$1" ]] && source "$1" || echo "ERROR loading ${1}"
}


autoload -Uz compinit
[[ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]] && compinit || compinit -C


###
# SYSTEM SETUP
###
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
