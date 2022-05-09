# ╔═══════════════════════╗
# ║  MAC SPECIFIC CONFIG  ║
# ╚═══════════════════════╝
export KITTY_CONFIG_DIRECTORY="${DOTFILES_FOLDER}/kitty"

# Allow keychain access to ssh keys
ssh-add --apple-load-keychain &> /dev/null

# Include Thinkific Specific helpers
[[ ${THINKIFIC_MACHINE} ]] && include ${ZSH_FOLDER}/thinkific.zsh

# Add nvm
include ${ZSH_FOLDER}/node.zsh

# ┌───────────────────┐
# │  ALIAS OVERRIDES  │
# └───────────────────┘

# Use exa rather than ls
alias lt="exa -l -a -h --git --icons --color never -T -L 2"     # Show folder tree
alias ll="exa -l -a -h --git --icons --color never"             # `ls` with icons

# --- END ALIASES ---
