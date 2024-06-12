#
# ~/.bashrc
#

source ~/git-prompt.sh

# Command prompt config
export PS1='\[\e[1;32m\][\[\e[033m\]\]\t \[\e[1;32m\]\u@\h \[\e[0;36m\]\w\[\e[1;32m\]]$(__git_ps1 "(\[\e[0;34m\]%s\[\e[1;32m\])")\n \[\e[0;34m\]λ \[\e[0m'

# Sets readline to vi mode
set -o vi

[[ $- != *i* ]] && return

export BASH_SILENCE_DEPRECATION_WARNING=1

#####################################################################################
###                                VIM CONFIG                                     ###
#####################################################################################
# alias to make nvim default editor
alias vim=nvim
export EDITOR=nvim

# Reloads config files
reconfig(){ 
  source ~/.bashrc;
  tmux source-file ~/.tmux.conf;
}

# Edit config aliases
alias bashrc="nvim ~/.bashrc && reconfig"
alias vimrc="nvim ~/.config/nvim/init.vim && reconfig"
alias tmuxrc="nvim ~/.tmux.conf && reconfig"

#####################################################################################
###                                 MY CONFIG                                     ###
#####################################################################################
export JAVA_HOME=/usr/lib/jvm/default
PATH="$HOME/bin:$PATH"


# Go up n directories if no arguments are supplied goes up 1
up() { 
  cd $(eval printf '../'%.0s {1..$1});
}

#####################################################################################
###                                 MY FUNCTIONS                                  ###
#####################################################################################

commit-file() {
  echo "committing message" $1 "with message" $2
  git add $1
  git commit -m "$2"
}

jumpto(){
  case $1 in
    repo) cd ~/repos ;;
    repos) cd ~/repos ;;
    claim) cd ~/repos/service-claim ;;
    claims) cd ~/repos/service-claim ;;
    personal) cd ~/personal_projects ;;
    pp) cd ~/personal_projects ;;
    dotfiles) cd ~/dotFiles ;; 
    downloads) cd ~/Downloads ;; 
    download) cd ~/Downloads ;; 
    docs) cd ~/Documents ;; 
    [0-9]) cd ${WAYPOINTS[$1]} ;;
    *) echo "No shortcut for" $1;;
  esac
}

alias jt=jumpto

alias ls="exa"

alias alacritty="sh -c 'open -g -n /Applications/Alacritty.app & kill -INT $!' > /dev/null 2>&1"

# Virtualenv aliases
alias avenv=". ./venv/bin/activate"
alias mvenv="virtualenv venv"
alias dvenv="deactivate"
alias pyhton="python"

function notify {
  msg="$*"
  osascript -e "display notification \"$msg\""
}

# Wrench aliases
alias wt="wrench trantor"
alias wtd="wrench deploy trantor"
alias wtmfa="wrench aws mfa_login"

function git-cleanup {
    git_branch="$(git rev-parse --abbrev-ref HEAD)"
    read -p "To confirm type the current branch name ($git_branch): " user_branch
    if [ "$user_branch" == "$git_branch" ]
    then
        git branch --merged | egrep -v "(^\*|master|main|dev|develop)" | xargs git branch -d
    else
        echo "Cancelled"
    fi
}

# BBM Bindings
export bbm_dev="BBM Dev"
export bbm_prod="Bought By Many (Prod)"
alias daemons="mongod --dbpath=/Users/davidclegg/MongoData/ & blackd"


# GO bindings
# Adds go to path
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin

alias readlink=greadlink

export PIPX_DEFAULT_PYTHON="$HOME/.pyenv/versions/3.8.13/bin/python"
. "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2022-09-26 12:53:26
export PATH="$PATH:/Users/davidclegg/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Elixir path tools
export PATH="$PATH:/usr/local/bin/elixir"

alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

export PATH="$PATH:/usr/bin/nvim"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
