#         _ _                     
#    __ _| (_) __ _ ___  ___  ___ 
#   / _` | | |/ _` / __|/ _ \/ __|
#  | (_| | | | (_| \__ \  __/\__ \
#   \__,_|_|_|\__,_|___/\___||___/
#                                 

alias vim="nvim"  # Use neovim instead of vim

alias lt="exa -l -a -h --git --icons --color never -T -L 2"     # Show folder tree
alias ll="exa -l -a -h --git --icons --color never"             # `ls` with icons

####
## GIT
####
alias gc="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"


# Download v.reddit videos
function vred {
    if [[ -z "$1" ]]; then
        echo "Usage: \n\t vred (url)"
        echo "\t Will download to current working folder"
        return 0
    fi

    $HOME/bin/vred --maxquality -u $1 -p $(pwd)
}
