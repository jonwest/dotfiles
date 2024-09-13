###
# ┌──────────────────────────────────────────────┐
# │                 NODE HELPERS                 │
# └──────────────────────────────────────────────┘
###

if [[ -d "${HOME}/.nvm" ]]; then
  export NVM_DIR="$HOME/.nvm"
  
  # Linux
  if [[ -s "${NVM_DIR}/nvm.sh" ]]; then 
    . "${NVM_DIR}/nvm.sh";
  fi

  # macOS
  if [[ $(uname) = Darwin ]] && [[ -s "$(brew --prefix nvm)/nvm.sh" ]]; then
    source $(brew --prefix nvm)/nvm.sh;
  fi
fi
