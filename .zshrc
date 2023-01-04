# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export EDITOR='nvim'

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
echo "$(cat $HOME/.config/banner_duck_2)" | lolcat -f
# NVM installation
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Aliases
alias gll='git pull --all'
alias vim="nvim"
alias clr='clear'
alias c='clear'
alias ssh='kitty +kitten ssh'
alias vz='nvim ~/.zshrc'
alias vn='nvim ~/.config/nvim/'
alias vk='nvim ~/.config/kitty/'
alias work="echo 'we are working 🎅' | lolcat && timer 45m"
alias break="echo 'happy break time! ⛄' | lolcat && timer 10m"

## TERRAFORM
alias tf='terraform'
alias terrafrom='terraform'
alias tfi='/usr/bin/terraform init'
alias tfp='/usr/bin/terraform plan'
alias tfa='/usr/bin/terraform apply'
alias tfr='/usr/bin/terraform -refresh-only'
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

## DOCKER
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcl="docker compose logs -f"

# kitty
bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→

# study stream aliases
alias work="echo 'we are working 🎅' | lolcat && timer 45m"
alias break="echo 'happy break time! ⛄' | lolcat && timer 10m"

