export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/google-chrome-stable

# Alias
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

## Docker
export DOCKER_FORMAT="\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"
