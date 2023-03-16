# ╔═════════════════════╗
# ║     DEVELOPMENT     ║
# ╚═════════════════════╝

# ZSH completion for Kubernetes
[[ $(which kubectl) ]] && source <(kubectl completion zsh)

# Add composer packages to path
[[ $(which composer) ]] && export PATH=${HOME}/.composer/vendor/bin:${PATH}
