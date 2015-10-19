#########################
##       BASICS        ##
#########################

# Startup Scripts 
#source venv/bin/activate

# Colorize the Terminal
export CLICOLOR=1
export TERM=xterm-color
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/share/python:$PATH"
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
PATH="/Users/nickma/.rbenv/versions/1.9.3-p392/bin/:$PATH"

# sourcing git helpers
if [ -f /usr/local/git/contrib/completion/git-completion.zsh ]; then
    . /usr/local/git/contrib/completion/git-completion.zsh
fi

if [ -f /usr/local/git/contrib/completion/git-prompt.sh ]; then
    . /usr/local/git/contrib/completion/git-prompt.sh
fi

function _update_ps1() {
    export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

#########################
##      ALIASES        ##
#########################

alias loc='cd /usr/local/workspace'
alias pipfiles='cd /usr/local/lib/python2.7/site-packages'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias g='git'
alias apachestart='sudo apachectl -k start'
alias apachestop='sudo apachectl -k stop'
alias sshaws='ssh -o "UserKnownHostsFile /dev/null"'
alias sha256='shasum -a 256'
alias sha1='shasum -a 1'
alias tmux='tmux -2'
alias please='ssh !!'
alias WS='/usr/local/workspace'

#########################
##      PowerLine      ##
#########################
export WORKON_HOME=$HOME/.virtualenvs
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

#########################
##      virtualenv     ##
#########################
export WORKON_HOME=$HOME/.virtualenvs
export PIP_DOWNLOAD_CACHE=$HOME/.pip_packages
#export PROJECT_HOME=$HOME/


#########################
##      Path ENVs      ##
#########################
export ANDROID_HOME=/Users/nickma/Documents/android-sdk-macosx
PATH="/Users/nickma/Documents/android-sdk-macosx/tools:$PATH"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export NODE_PATH="/usr/local/lib/node"


#########################
##      FUNCs          ##
#########################

function git_push_new {
    git push -u origin $1
}

function git_new_br {
    git co -b $1 && git_push_new $1
}
