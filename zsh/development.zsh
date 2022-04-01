# ╔═════════════════════╗
# ║     DEVELOPMENT     ║
# ╚═════════════════════╝

# ZSH completion for Kubernetes
[[ $(which kubectl) ]] && source <(kubectl completion zsh)

[[ $(which rbenv) ]] && eval "$(rbenv init - zsh)" && export PATH=~/.rbenv/shims:$PATH
