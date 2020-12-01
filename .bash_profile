# ------------------------------------------------------------------
# Description: File containing all BASH configurations.
# ------------------------------------------------------------------

# ------------------------
#  BASH SETTINGS
# ------------------------

# Bash promp (green)
export PS1="\[\e[32m\]\u\[\e[m\] \[\e[32m\]\W\[\e[m\] \[\e[32m\]\\$\[\e[m\] "

# Directory colour in ls
export CLICOLOR=1
export LS_COLORS="di=31"

# ------------------------
#  PATH DIRECTORIES
# ------------------------

export PATH="/Users/ewanjones/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/bin/python:$PATH"
export PATH="/Users/ewanjones/Library/Python/3.7/bin:$PATH"
# Java version 1.8 required for neo4j
export JAVA_HOME=$(/usr/libexec/java_home)

# ------------------------
#  SHORTCUTS
# ------------------------

# Use macvim in place of vim
alias vim='mvim -v'

alias today='date +"%A, %B %-d, %Y"'
alias ~="cd ~"
alias c='clear'
alias bin='cd ~/bin'
alias jn='jupyter notebook'
alias ..='cd ..'

alias co='checkout'
alias blame='git blame'
alias pull='git pull'
alias push='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gl='git log'
alias gll='git log --oneline --decorate'
alias gs='git status'
alias ga='git add'
alias gpf='git push -f origin'
alias pr='hub pull-request'
alias gc='git commit'
alias gca='git commit --amend'
alias gcane='git commit --amend --no-edit'
alias grb='git rebase `git rev-list master.. | tail -1`^'
alias grbc='git rebase --continue'
alias grbi='git rebase -i `git rev-list master.. | tail -1`^'
alias gdm='git diff master'
alias gdms='git diff master --stat'
alias lg='lazygit'

alias docker-clean=" \
    docker system prune && docker ps -aq --no-trunc | xargs docker rm && \
    docker rmi $(docker images --filter "dangling=true" -q --no-trunc) \
    docker volume rm $(docker volume ls -qf dangling=true) \
"
alias git-clean="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d"

alias dc="docker-compose"
alias run="docker-compose up support consumer"

# ------------------------
#  MISC
# ------------------------

# iterm2 bash integration init
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
source ~/.iterm2_shell_integration.bash

# git autocomplete
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

source ~/.scripts/django_bash_completion.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
