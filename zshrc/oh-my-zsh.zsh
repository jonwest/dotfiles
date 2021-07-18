#                                                                                                                                                      
#                              ::.                                                                                          .:.                        
#                             .--:                                                                                         .--:                        
#                             .--.                                                                                         .--.                        
#                ........     :-::........           ......    .....      ...      ...     .............     ............  .-::........                
#             .:---::::---:   :-::::::::---:       :--:::---::---:---:.  .--:      :-:    .-::::::::::--:. .:--::::::::::  :-::::::::---:              
#            .--:       .:-:  :-:        .:-:     :--.    .:--:.   .:--. .--.      --:                .:-. --:             :-:        .:-:             
#         ..:-::         :::  -:::.       :-:  ..::::      :-:      .--. .--.     .-::..      ....::.::-:  :-:.::::.....   ::::.       :-:             
#        .---:-:         ::: .-:---:      :-:  ---:-:      :-:      :--. :--      .-::--.  ::-----:::::.    .::::::-----: .-::--:      :-:             
#        .-:::::        .--. .-:::-.     .--. .-:::-:      :-:      :-:  :-:.     :-:::-  :-::::.                  .-:::-..-:::-.      --:             
#         :-----::::::::--.  :-----.     .--. .---:-.     .--:      --:   :--:::::::::-: .-::--:.:::::::.  .::::::::----: :-----.     .--.             
#           .:::::::::::.    .:::::      .::  .:::::       ::.      ::.    .:::::::-:::: .::::::::::::::.  ::::::::::::.  .:::::      .::.             
#                                                                                .-:::-.                                                               
#                                                                          .:::::-----.                                                                
#                                                                          .:::::::..                                                                  
# 

export ZSH="/home/capn/.oh-my-zsh"

###
# Make it real purty like
###
ZSH_THEME="jons"

###
# Plugins Setup
###

# Install Zplugin
# Usage:
#   install_zplugin $PLUGIN_NAME $REPO_URL
install_zplugin() {
    [[ -d "$HOME/.oh-my-zsh/custom/plugins/$1" ]] || git clone --depth 1 "${2}" "$HOME/.oh-my-zsh/custom/plugins/$1"
}

install_zplugin "zsh-autosuggestions"       "https://github.com/zsh-users/zsh-autosuggestions"
install_zplugin "zsh-syntax-highlighting"   "https://github.com/zsh-users/zsh-syntax-highlighting"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

plugins=(
    cp
    git
    zsh-autosuggestions 
    zsh-syntax-highlighting
)

###
# Load up oh-my-zsh installation
###
source $ZSH/oh-my-zsh.sh
