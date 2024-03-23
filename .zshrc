# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  aliases
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  kubectl
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
echo "$(cat $HOME/.config/banner_duck_2)" | lolcat -f

# # NVM installation
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set default editor
export EDITOR='nvim'

# This is the default, but prefer explicit over implicit
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

# Aliases
alias gll='git pull --all'
alias vim="nvim"
alias nv="nvim"
alias clr='clear'
alias c='clear'
alias vz='nvim ~/.zshrc'
alias vn='nvim ~/.config/nvim/'
alias vk='nvim ~/.config/kitty/'
alias hrg="history 1 | rg"
alias h="history 1"


## TERRAFORM
alias tf='terraform'
alias terrafrom='terraform'
alias tfi='/usr/bin/terraform init'
alias tfp='/usr/bin/terraform plan'
alias tfa='/usr/bin/terraform apply'
alias tfr='/usr/bin/terraform -refresh-only'
alias tga='terragrunt apply --auto-approve'
alias tgp='terragrunt plan'
alias tgflush='find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;'
## K8s
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'
alias kstart='minikube start'
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
case "$OSTYPE" in
   linux*)
      bindkey "\e[1;5D" backward-word # ⌥←
      bindkey "\e[1;5C" forward-word # ⌥→
      ;;
   darwin*)
      bindkey "\e[1;3D" backward-word # ⌥←
      bindkey "\e[1;3C" forward-word # ⌥→
      ;;
esac

# study stream aliases
alias work="echo 'we are working 🎅' | lolcat && timer 45m"
alias break="echo 'happy break time! ⛄' | lolcat && timer 10m"

# Aliases with autocomplete
[[ ! -f ~/.config/aliases/ph_aliases.sh ]] || source ~/.config/aliases/ph_aliases.sh
[[ ! -f ~/.config/aliases/fca_aliases.sh ]] || source ~/.config/aliases/fca_aliases.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Initialize the autocompletion
autoload -Uz compinit && compinit -i
