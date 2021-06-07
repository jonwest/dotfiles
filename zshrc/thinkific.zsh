#   _   _     _       _    _  __ _      
#  | |_| |__ (_)_ __ | | _(_)/ _(_) ___ 
#  | __| '_ \| | '_ \| |/ / | |_| |/ __|
#  | |_| | | | | | | |   <| |  _| | (__ 
#   \__|_| |_|_|_| |_|_|\_\_|_| |_|\___|
#                                       

export THINKIFICPATH="$HOME/Thinkific"
alias kubestg="kubectl config use-context eks-st"
alias kubeprod="kubectl config use-context eks-pr"

# Set AWS account switching shortcuts
alias awsinfra="rm $HOME/.aws/config && rm $HOME/.aws/credentials && cp $HOME/.aws/infra-mgr-config $HOME/.aws/config && cp $HOME/.aws/infra-mgr-creds $HOME/.aws/credentials"
alias awsstd="rm $HOME/.aws/config && rm $HOME/.aws/credentials && cp $HOME/.aws/std-config $HOME/.aws/config && cp $HOME/.aws/std-credentials $HOME/.aws/credentials"

# Generate OVPN credentials
# function genvpn {
#     if [[ -z "$1" || -z "$2" ]]; then
#         echo "Usage: \n\t genvpn (env) (user)"
#         exit
#     fi

#     if [[ "$1" == "production" ]]; then CONNECTION="ec2-user@vpn.thinkific.com"; fi
#     if [[ "$1" == "staging" ]]; then CONNECTION="ec2-user@vpn.thinkific-staging.com"; fi

#     echo "Connecting and creating OVPN file...";
#     ssh -i "$HOME/.aws/thinkific-$1-us-east-1.pem" "$CONNECTION" "sudo ./create_client.sh $2 && sudo chown ec2-user *.ovpn";

#     echo "Downloading created OVPN file..."
#     scp -i "$HOME/.aws/thinkific-$1-us-east-1.pem" "$CONNECTION:$2.ovpn" $(pwd)/$2-$1.ovpn;
# }

# Connecting to VPN
function vpn {
    if [[ -z "$1" || -z "$2" ]]; then
        echo "Usage: \n\t vpn (connect|disconnect) (environment)"
        exit
    fi

    OP=$1;
    VPN=$2;

    if [[ "$OP" == "c" ]]; then $OP="connect"; fi
    if [[ "$OP" == "d" ]]; then $OP="disconnect"; fi
    if [[ "$VPN" == "production" ]]; then $VPN="prod"; fi
    if [[ "$VPN" == "stg" ]]; then $VPN="staging"; fi

    osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "${OP} \"thinkific-${VPN}\"" -e "end tell"
}

# Get OVPN credentials
function getvpn {
    if [[ -z "$1" || -z "$2" ]]; then
        echo "Usage: \n\t getvpn (env) (user)"
        exit
    fi

    if [[ "$1" == "production" ]]; then CONNECTION="ec2-user@10.0.1.12"; fi
    if [[ "$1" == "staging" ]]; then CONNECTION="ec2-user@10.0.1.254"; fi

    echo "Connecting and downloading OVPN file to $(pwd)/$2-$1.ovpn...";
    vpn c $1;
    sleep 5;
    scp -o IdentitiesOnly=yes -i "~/.aws/thinkific-vpn-$1-us-east-1.pem" "$CONNECTION:~/$2.ovpn" "./$2-$1.ovpn"
    vpn d $1;
}



# Powerlevel9k Tweaks
typeset -g POWERLEVEL9K_AWS_CLASSES=(
      '*think-pr*'  PROD    # These values are examples that are unlikely
      '*think-st*'  STAGING    # to match your needs. Customize them as needed.
      '*'           DEFAULT)
typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
      '*pr*'  PROD       # These values are examples that are unlikely
      '*st*'  STAGING    # to match your needs. Customize them as needed.
      '*'     DEFAULT)


###
# Terraform/Terragrunt
###
alias terragrunt=/Users/capn/bin/terragrunt_0.26.7
alias terraform="$HOME/bin/tf13.5"
alias tf="terraform"
alias tg="terragrunt"
