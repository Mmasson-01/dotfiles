alias clr='clear'
# GIT Aliases
alias gst='git status'
alias gp='git push'
alias gc='git commit'
alias gll='git pull --all'
alias glog='git log --oneline --decorate --graph --all'

# Utils Aliases
alias ga='git add'
alias ..='cd ..'
alias ....='cd ../../'
alias grep='grep --color=auto'

# Neovim alias
alias vim='nvim'

export DOCKER_FORMAT="\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
