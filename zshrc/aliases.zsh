#         _ _                     
#    __ _| (_) __ _ ___  ___  ___ 
#   / _` | | |/ _` / __|/ _ \/ __|
#  | (_| | | | (_| \__ \  __/\__ \
#   \__,_|_|_|\__,_|___/\___||___/
#                                 

alias vim="nvim"  # Use neovim instead of vim

if [[ $(uname) = Darwin ]]; then
  alias lt="exa -l -a -h --git --icons --color never -T -L 2"     # Show folder tree
  alias ll="exa -l -a -h --git --icons --color never"             # `ls` with icons
else
  alias lt="ls -alh"
  alias ll="ls -alh"
fi

####
## GIT
####
alias gc="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"

