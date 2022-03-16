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
include $DOTFILES/aliases.zsh         #  Convenience aliases
include $HOME/.zshsecrets             #  Sensitive material that shouldn't be in version control

if [[ $(uname) = Darwin ]]; then 
  include $DOTFILES/tmux.zsh            #  Create or attach to a tmux session on start
fi


####
## PREFERENCE
####
autoload zmv

# Match oh-my-zsh history searching
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
