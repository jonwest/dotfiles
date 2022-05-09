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

  export DOTFILES_FOLDER="${HOME}/Customization/dotfiles"
  export ZSH_FOLDER="${DOTFILES_FOLDER}/zsh"

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
  # Don't output an error if machine specific overrides are not present
  [[ -f "${HOME}/.machine_prefs" ]] && source "${HOME}/.machine_prefs"
  
  include $ZSH_FOLDER/plugins.zsh
  include $ZSH_FOLDER/aliases.zsh
  [[ $(uname) = Darwin ]] && include $ZSH_FOLDER/mac.zsh
  [[ ${REMOTE_CONTAINERS} ]] && include $ZSH_FOLDER/dev-container.zsh

eval "$(starship init zsh)"
