#   _   _     _       _    _  __ _      
#  | |_| |__ (_)_ __ | | _(_)/ _(_) ___ 
#  | __| '_ \| | '_ \| |/ / | |_| |/ __|
#  | |_| | | | | | | |   <| |  _| | (__ 
#   \__|_| |_|_|_| |_|_|\_\_|_| |_|\___|
#                                       

export THINKIFICPATH="$HOME/Thinkific"
alias kubestg="kubectl config use-context eks-st"
alias kubeprod="kubectl config use-context eks-pr"

# Powerlevel9k Tweaks
typeset -g POWERLEVEL9K_AWS_CLASSES=(
      '*think-pr*'  PROD    # These values are examples that are unlikely
      '*think-st*'  STAGING    # to match your needs. Customize them as needed.
      '*'           DEFAULT)
typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
      '*pr*'  PROD       # These values are examples that are unlikely
      '*st*'  STAGING    # to match your needs. Customize them as needed.
      '*'     DEFAULT)
