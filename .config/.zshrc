# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"
plugins=(
git
dotenv
zsh-autosuggestions
zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export EDITOR='nvim'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# echo "$(cat $HOME/.config/banner)" | lolcat
# echo "$(cat $HOME/.config/banner_duck)" | lolcat
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
echo "$(cat $HOME/.config/banner_duck_2)" | lolcat

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=/usr/bin/google-chrome-stable
export DOCKER_FORMAT="\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"

# Aliases
## K8s
alias k='kubectl'
alias kstart='minikube start - vm-driver kvm2'
alias kstop='minikube stop --all'
alias kgp='kubectl get pod'
alias kgd='kubectl get deployment'
alias kgs='kubectl get services'
alias kgr='kubectl get replicaset'
alias kgrc='kubectl get replicationcontroller'
alias kga='kubectl get all'

## GIT
alias gll='git pull --all'
alias starstruck_git='export GIT_SSH_COMMAND="ssh -i ~/.ssh/starstruck/id_rsa -o IdentitiesOnly=yes"'

# UTILS
alias clr='clear'
alias grep='grep --color=auto'

## Neovim
alias vim='nvim'

alias ssh="kitty +kitten ssh"

# study stream aliases
alias work="echo 'we are working 🎅' | lolcat && timer 45m"
alias break="echo 'happy break time! ⛄' | lolcat && timer 10m"
