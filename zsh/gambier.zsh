#!/bin/zsh

# Gambier Shim

gambier() {
  if [[ "$#" == 0 ]]; then 
    echo "Gambier requires at least one argument."; 
    return; 
  fi

  local subcommand=$1; shift

  case $subcommand in
    commit)   commitizen;;
    cz)       commitizen;;
    pr)       pullRequest "$@";;
  esac
}


commitizen() {
  echo -e "'gambier commit' has been deprecated in favour of using Commitizen directly ('cz commit')."
  if [[ $(which cz) ]]; then
    command cz commit
  else
    echo "Commitizen is not installed, please ping Dexter's Lab for instructions."
  fi
}


pullRequest() {
  echo -e "'gambier pr' has been deprecated in favour of using the Github CLI directly ('gh pr create')."
  if [[ $(which gh) ]]; then
    command echo "gh pr create -B $@ -w"
  else
    echo "Github CLI is not installed, please ping Dexter's Lab for instructions."
  fi
}
