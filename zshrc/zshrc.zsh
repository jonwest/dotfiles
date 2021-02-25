#             _              
#     _______| |__  _ __ ___ 
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__ 
#  (_)___|___/_| |_|_|  \___|
# -----------------------------
# zmodload zsh/zprof
export DOTFILES="$HOME/Customization/dotfiles/zshrc"

###
# HELPERS
###
include() {
    [[ -f "$1" ]] && source "$1" || echo "ERROR loading ${1}"
}


autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi


###
# PLUGINS
###
source $HOME/.zplug/init.zsh;
zplug "nyquase/vi-mode"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug load


###
# SYSTEM SETUP
###
export LANG=en_US.UTF-8
export EDITOR='nvim'

# include $ZSH/oh-my-zsh.sh            #  Core oh-my-zsh scripts
include $HOME/.zshsecrets            #  Sensitive material that shouldn't be in version control
include $DOTFILES/aliases.zsh        #  Convenience aliases
include $DOTFILES/development.zsh    #  Development modifiers
include $DOTFILES/thinkific.zsh      #  Thinkific specific helpers
include $DOTFILES/p10k.zsh          #  Powerlevel10k configuration
include $DOTFILES/tmux.zsh

# zprof
