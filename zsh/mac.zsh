# ╔═══════════════════════╗
# ║  MAC SPECIFIC CONFIG  ║
# ╚═══════════════════════╝
export KITTY_CONFIG_DIRECTORY="${DOTFILES_FOLDER}/kitty"

# Allow keychain access to ssh keys
ssh-add --apple-load-keychain &> /dev/null

# Add nvm
include ${ZSH_FOLDER}/node.zsh

# Dev Container additional packages
export DEV_PACKAGES="zsh python3"

# ┌───────────────────┐
# │  ALIAS OVERRIDES  │
# └───────────────────┘

# Use exa rather than ls
alias lt="exa -l -a -h --git --icons --color never -T -L 2"     # Show folder tree
alias ll="exa -l -a -h --git --icons --color never"             # `ls` with icons

# Lazygit convenience
alias lg="lazygit"

# Youtube-dl
function ytdl {
    if [[ -z "$1" ]]; then
        echo "Usage: \n\t ytdl (youtube-video-id)"
        exit
    fi

    VIDEO_ID="${1}"

    youtube-dl -f best "https://youtube.com/watch?v=${1}"
}

# --- END ALIASES ---
