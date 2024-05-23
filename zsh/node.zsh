lazynvm() {
  export NVM_DIR=${HOME}/.nvm

  [ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
  if [ -f "${NVM_DIR}/etc/bash_completion.d/nvm" ]; then
    [ -s "${NVM_DIR}/etc/bash_completion.d/nvm" ] && \. "${NVM_DIR}/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  fi
}

nvm() {
  unset -f nvm
  lazynvm 
  nvm $@
}

node() {
  unset -f node
  lazynvm
  node $@
}

npm() {
  unset -f npm
  lazynvm
  npm $@
}

npx() {
  unset -f npx
  lazynvm
  npx $@
}

yarn() {
  unset -f yarn
  lazynvm
  yarn $@
}
