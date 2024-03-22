lazynvm() {
  unset -f nvm node npm npx
  export NVM_DIR=${HOME}/.nvm
   [ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
  if [ -f "${NVM_DIR}/etc/bash_completion.d/nvm" ]; then
    [ -s "${NVM_DIR}/etc/bash_completion.d/nvm" ] && \. "${NVM_DIR}/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  fi
}

nvm() {
  lazynvm 
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}

npx() {
  lazynvm
  npx $@
}

yarn() {
  lazynvm
  yarn $@
}
