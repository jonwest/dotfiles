#       _                _                                  _   
#    __| | _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_ 
#   / _` |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
#  | (_| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_ 
#   \__,_|\___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|
#                               |_|                             

####
## Kubernetes
####
[[ -x "$(command -v kubectl)" ]] && source <(kubectl completion zsh)    # ZSH completion for k8s


####
## Ruby
####
_evalcache rbenv init -
