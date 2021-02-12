#             _              
#     _______| |__  _ __ ___ 
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__ 
#  (_)___|___/_| |_|_|  \___|
# -----------------------------
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/Customization/dotfiles/zshrc"

ZSH_THEME="powerlevel10k/powerlevel10k"

###
# HELPERS
###
include() {
    [[ -f "$1" ]] && source "$1"
}


###
# PLUGINS
###
plugins=(
    git                       # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git/
    git-extras                # https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins#git-extras
    kubectl                   # https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/kubectl/README.md
    iterm2
    vi-mode                   # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
)


###
# SYSTEM SETUP
###
export LANG=en_US.UTF-8
export EDITOR='nvim'

ZSH_DISABLE_COMPFIX=true
ENABLE_CORRECTION="false"
unsetopt correct_all
COMPLETION_WAITING_DOTS="true"

include $ZSH/oh-my-zsh.sh            #  Core oh-my-zsh scripts
include $HOME/.zshsecrets            #  Sensitive material that shouldn't be in version control
include $DOTFILES/aliases.zsh        #  Convenience aliases
include $DOTFILES/development.zsh    #  Development modifiers
include $DOTFILES/thinkific.zsh      #  Thinkific specific helpers
include $DOTFILES/.p10k.zsh          #  Powerlevel10k configuration

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
