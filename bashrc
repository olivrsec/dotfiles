# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias xi='sudo xbps-install'

PS1="\u@\h:\w\$ "

export NODE_PATH="$(npm root -g)"
export PATH=$PATH:/home/olivr/.spicetify

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$PATH:~/go/bin

# Created by `pipx` on 2026-01-13 04:15:49
export PATH="$PATH:/home/olivr/.local/bin"

# dotnet
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools
