# auto tmux

#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#    tmux attach -t default || tmux new -s default
#fi

# git
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# terminal css
PROMPT='%F{gray}%n%f@%F{gray}%m%f:%F{69}%B%~%b%f$ '
RPROMPT='${vcs_info_msg_0_}'

# environment
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
autoload -U +X compinit && compinit
source <(kubectl completion zsh)

export CLICOLOR=1
alias ls="ls -G"
alias ll="ls -alG"

# k8s
ksns(){
  kubectl config set-context $(kubectl config current-context) --namespace=${1-default}
}

alias k="kubectl" 
alias kg="kubectl get $1"
alias kgp="kubectl get pods"
alias kga="kubectl get all"
alias kgns="kubectl get namespace"

# idk
clipcopy () {
  pbcopy < "${1:-/dev/stdin}"
}

clippaste () {
  pbpaste
}

listening() {
  if [ $# -eq 0 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -n -P
  elif [ $# -eq 1 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
  else
    echo "Usage: listening [pattern]"
  fi
}

chrome() {
    URL=$1
    if [[ $1 != http* ]] ; then
        URL="http://$1"
    fi
    /usr/bin/open -a '/Applications/Google Chrome.app' "$URL"
}

rawurlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER)
  REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}

alias tmuxa="tmux attach-session"

# IDK really

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yondonrinchin/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yondonrinchin/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yondonrinchin/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yondonrinchin/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# kubectl auto-completion
source <(kubectl completion zsh)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

alias tree="tree -I 'node_modules|venv|cache|__pycache__|test_*'"
