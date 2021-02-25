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
## Node
####
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
