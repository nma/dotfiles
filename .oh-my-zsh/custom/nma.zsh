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

#########################
##      PowerLine      ##
#########################
function _update_ps1() {
    export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

#########################
##      virtualenv     ##
#########################
export WORKON_HOME=$HOME/.virtualenvs
export PIP_DOWNLOAD_CACHE=$HOME/.pip_packages
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
#export PROJECT_HOME=$HOME/

#########################
##      Path ENVs      ##
#########################
export ANDROID_HOME=/Users/nickma/Documents/android-sdk-macosx
PATH="/Users/nickma/Documents/android-sdk-macosx/tools:$PATH"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export NODE_PATH="/usr/local/lib/node"
export WS='~/workspace'

#########################
##      ALIASES        ##
#########################

alias loc='cd $WS'
alias pipfiles='cd /usr/local/lib/python2.7/site-packages'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias g='git'
alias apstart='sudo apachectl -k start'
alias apstop='sudo apachectl -k stop'
alias sshaws='ssh -o "UserKnownHostsFile /dev/null"'
alias sha256='shasum -a 256'
alias sha1='shasum -a 1'
alias tmux='tmux -2'
alias please='ssh !!'
alias tl='task list'
alias tc='task end.after:today-1wk completed'
alias ts='task sync'
 
#########################
##      FUNCs          ##
#########################

function git_push_new {
    git push -u origin $1
}

function git_new_br {
    git co -b $1 && git_push_new $1
}

function tcp_keepalive {
    sudo /sbin/sysctl -w net.ipv4.tcp_keepalive_time=200 net.ipv4.tcp_keepalive_intvl=200 net.ipv4.tcp_keepalive_probes=5
}

function conda_up {
    export PATH=~/anaconda3/bin:$PATH
}
