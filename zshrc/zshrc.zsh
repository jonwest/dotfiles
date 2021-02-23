# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#             _              
#     _______| |__  _ __ ___ 
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__ 
#  (_)___|___/_| |_|_|  \___|
# -----------------------------
export DOTFILES="$HOME/Customization/dotfiles/zshrc"

###
# HELPERS
###
include() {
    [[ -f "$1" ]] && source "$1"
}

####
## Zsh Setup
####
ZSH_DISABLE_COMPFIX=true
ENABLE_CORRECTION="false"
unsetopt correct_all


####
## SYSTEM SETUP
####
export LANG=en_US.UTF-8
export EDITOR='nvim'

include $HOME/.zprezto/init.zsh      #  Prezto
include $HOME/.zshsecrets            #  Sensitive material that shouldn't be in version control
include $DOTFILES/aliases.zsh        #  Convenience aliases
include $DOTFILES/development.zsh    #  Development modifiers
include $DOTFILES/thinkific.zsh      #  Thinkific specific helpers
include $DOTFILES/plugins.zsh        #  zPlug Plugins
include $DOTFILES/p10k.zsh           #  Powerlevel10k
include $DOTFILES/tmux.zsh           #  Tmux
