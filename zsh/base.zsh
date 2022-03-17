# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║     
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
                                        

# ╔════════════════════════╗
# ║   BASE CONFIGURATION   ║
# ╚════════════════════════╝
  bindkey -v  # Use vi-mode
  export LANG=en_US.UTF-8
  [[ $(which nvim) ]] && export EDITOR='nvim'
  export DOTFILES="$HOME/Customization/dotfiles/zsh"

# Use zsh mv syntax (allow pattern matching)
#   See: https://github.com/zsh-users/zsh/blob/master/Functions/Misc/zmv
  autoload zmv

# Use arrow keys to cycle through historical commands
  bindkey '\e[A' history-beginning-search-backward
  bindkey '\e[B' history-beginning-search-forward

# --- END BASE CONFIGURATION ---


# ┌────────────────────────┐
# │    HELPER FUNCTIONS    │
# └────────────────────────┘

# Include other scripts if they exist on the system
  include() {
      [[ -f "$1" ]] && source "$1" || echo "ERROR loading ${1}"
  }

# --- END HELPER FUNCTIONS ---



# ╔═══════════════════════╗
# ║ LOAD IT ALL UP, CHIEF ║
# ╚═══════════════════════╝
  include $DOTFILES/plugins.zsh
  include $DOTFILES/aliases.zsh
  include $DOTFILES/p10k.zsh
  [[ $(uname) = Darwin ]] && include $DOTFILES/mac.zsh
  [[ ${REMOTE_CONTAINERS} ]] && include $DOTFILES/dev-container.zsh

# Don't use tmux in a dev container
  [[ ${TERM_PROGRAM} = vscode ]] || include $DOTFILES/tmux.zsh
