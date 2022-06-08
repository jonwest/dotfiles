#   _   _     _       _    _  __ _      
#  | |_| |__ (_)_ __ | | _(_)/ _(_) ___ 
#  | __| '_ \| | '_ \| |/ / | |_| |/ __|
#  | |_| | | | | | | |   <| |  _| | (__ 
#   \__|_| |_|_|_| |_|_|\_\_|_| |_|\___|
#                                       

export THINKIFICPATH="$HOME/Thinkific"
export DEV_PACKAGES="zsh neovim iputils-ping dnsutils"

# Netskope fixes
export AWS_CA_BUNDLE='/opt/homebrew/etc/ca-certificates/cert.pem'       # AWS SSL
export GIT_SSL_CAINFO='/opt/homebrew/etc/ca-certificates/cert.pem'      # Git SSL
export REQUESTS_CA_BUNDLE='/opt/homebrew/etc/ca-certificates/cert.pem'  # Python SSL
export SSL_CERT_FILE='/opt/homebrew/etc/ca-certificates/cert.pem'       # Ruby SSL

source ${ZSH_FOLDER}/gambier.zsh

alias kubestg="kubectl config use-context eks-st"
alias kubeprod="kubectl config use-context eks-pr"

# Set AWS account switching shortcuts
alias awsinfra="rm $HOME/.aws/config && rm $HOME/.aws/credentials && cp $HOME/.aws/infra-mgr-config $HOME/.aws/config && cp $HOME/.aws/infra-mgr-creds $HOME/.aws/credentials"
alias awsstd="rm $HOME/.aws/config && rm $HOME/.aws/credentials && cp $HOME/.aws/std-config $HOME/.aws/config && cp $HOME/.aws/std-credentials $HOME/.aws/credentials"

# Connecting to VPN
function vpn {
    if [[ -z "$1" || -z "$2" ]]; then
        echo "Usage: \n\t vpn (connect|disconnect) (environment)"
        exit
    fi

    OP=$1;
    VPN=$2;

    if [[ "$OP" == "c" ]]; then OP="connect"; fi
    if [[ "$OP" == "d" ]]; then OP="disconnect"; fi
    if [[ "$VPN" == "production" ]]; then VPN="prod"; fi
    if [[ "$VPN" == "stg" ]]; then VPN="staging"; fi

    osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "${OP} \"${VPN}\"" -e "end tell"
}

# Get OVPN credentials
function getvpn {
  STAGING_IP="10.0.1.16"
  PROD_IP="10.0.1.12"

  if [[ -z "$1" ]]; then
    echo "Usage: \n\t getvpn (user_name)"
    exit
  fi

  echo "Connecting and downloading OVPN file to $(pwd)/$1-staging.ovpn...";
  vpn c staging;
  sleep 5;
  scp -o IdentitiesOnly=yes -i "~/.aws/thinkific-vpn-staging-us-east-1.pem" "ec2-user@${STAGING_IP}:~/$1.ovpn" "./$1-staging.ovpn"
  vpn d staging;
  sleep 5;
  echo "Connecting and downloading OVPN file to $(pwd)/$1-production.ovpn...";
  vpn c production;
  sleep 5;
  scp -o IdentitiesOnly=yes -i "~/.aws/thinkific-vpn-production-us-east-1.pem" "ec2-user@${PROD_IP}:~/$1.ovpn" "./$1-production.ovpn"
  vpn d staging;
}

###
# Terraform/Terragrunt
###
alias terragrunt="$HOME/bin/terragrunt_0.26.7"
alias terraform="$HOME/bin/tf13.5"
alias tf="terraform"
alias tg="terragrunt"
