# ╔═══════════════════════╗
# ║  MAC SPECIFIC CONFIG  ║
# ╚═══════════════════════╝
export KITTY_CONFIG_DIRECTORY="$HOME/Customization/dotfiles/kitty"

# Include Thinkific Specific helpers
include ${DOTFILES}/thinkific.zsh


# ┌───────────────────┐
# │  ALIAS OVERRIDES  │
# └───────────────────┘

# Use exa rather than ls
alias lt="exa -l -a -h --git --icons --color never -T -L 2"     # Show folder tree
alias ll="exa -l -a -h --git --icons --color never"             # `ls` with icons

# --- END ALIASES ---