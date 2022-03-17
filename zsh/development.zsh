# ╔═════════════════════╗
# ║     DEVELOPMENT     ║
# ╚═════════════════════╝

# ZSH completion for Kubernetes
[[ $(which kubectl) ]] && source <(kubectl completion zsh)
