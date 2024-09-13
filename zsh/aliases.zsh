# ╔═══════════════════════╗
# ║   UNIVERSAL ALIASES   ║
# ╚═══════════════════════╝
[[ $(which nvim) ]] && alias vim="nvim"
[[ $(which terraform) ]] && alias tf="terraform"


# ┌─────────────────────┐
# │     NAVIGATION      │
# └─────────────────────┘
alias lt="ls -alh"
alias ll="ls -alh"
alias lsd="ll -d */"

# ┌─────────────────────┐
# │   VERSION CONTROL   │
# └─────────────────────┘
alias lg="lazygit"

git_gc() {
  # Check if the parent directory is provided
  if [ -z "$1" ]; then
    echo "Usage: git_gc <parent_directory>";
    exit 1;
  fi

  local parent_dir="$1";

  # Ensure the provided path is a directory
  if [ ! -d "$parent_dir" ]; then
    echo "Error: $parent_dir is not a valid directory.";
    return 1;
  fi

  find "$parent_dir" -type d -maxdepth 1 | while read -r dir; do
    # Check if the directory is a git repository
    if [ -d "$dir/.git" ]; then
      echo "Running 'git gc' in $dir";
      (cd "$dir" && git gc);
    fi
  done

  echo "Completed running 'git gc' in all git repositories.";
}
