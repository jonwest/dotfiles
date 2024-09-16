# ╔═══════════════════════╗
# ║   UNIVERSAL ALIASES   ║
# ╚═══════════════════════╝
[[ $(which nvim) ]] && alias vim="nvim"
[[ $(which terraform) ]] && alias tf="terraform"
[[ $(which kubecolor) ]] && alias kubectl="kubecolor";


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

# Get the size of a Docker image without pulling it
get_image_size() {
  local image=$1

  if [ -z "$image" ]; then
    echo "Usage: get_image_size <image>"
    return 1
  fi

  # Fetch the manifest list and extract the digest for the amd64 image
  local amd64_digest=$(docker manifest inspect "$image" | jq -r '.manifests[] | select(.platform.architecture == "amd64") | .digest')

  if [ -z "$amd64_digest" ]; then
    echo "Failed to find an amd64 image for the given image."
    return 1
  fi

  # Fetch the amd64 image manifest and sum the sizes of the layers
  local total_size=$(docker manifest inspect "$image@$amd64_digest" | jq '[.layers[].size] | add')

  if [ -z "$total_size" ]; then
    echo "Failed to get the image size. Make sure the image exists and you have access to it."
    return 1
  fi

  echo "Total size: $(numfmt --to=iec-i --suffix=B $total_size)"
}
