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

# nvm initialization is _slow as hell_.  Fix it with: https://www.reddit.com/r/node/comments/4tg5jg/lazy_load_nvm_for_faster_shell_start/d5ib9fs/
declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)

NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

load_nvm () {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

for cmd in "${NODE_GLOBALS[@]}"; do
    eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done
