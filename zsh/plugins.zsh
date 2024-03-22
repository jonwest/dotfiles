# ╔════════════════════════╗
# ║      PLUGIN SETUP      ║
# ╚════════════════════════╝


# ┌────────────────────────┐
# │  ZINIT INITIALIZATION  │
# └────────────────────────┘
export ZINIT[HOME_DIR]="${ZSH_FOLDER}/zinit"

if [[ ! -f "${ZINIT[HOME_DIR]}/zinit.git/zinit.zsh" ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "${ZINIT[HOME_DIR]}" && command chmod g-rwX "${ZINIT[HOME_DIR]}"
  command git clone https://github.com/zdharma-continuum/zinit "${ZINIT[HOME_DIR]}/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

source "${ZINIT[HOME_DIR]}/zinit.git/zinit.zsh";

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# ---- INITIALIZATION COMPLETE ---- #

# ┌────────────────────────┐
# │   UNIVERSAL PLUGINS    │
# └────────────────────────┘
zinit light "zsh-users/zsh-autosuggestions"               # Use fish style autosuggestions
zinit light "zsh-users/zsh-completions"                   # Add tab completion
zinit light "zdharma-continuum/fast-syntax-highlighting"  # Add syntax highlighting


####
## AUTOSUGGESTIONS
####
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20


####
## Syntax Highlighting
####

# Use the "clean" theme for syntax highlighting:
[[ $(fast-theme -s | grep 'clean' ) ]] || fast-theme clean
