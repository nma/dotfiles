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

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

function _update_ps1() {
    export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

_dir_chomp () {
    local IFS=/ c=1 n d
    local p=(${1/#$HOME/\~}) r=${p[*]}
    local s=${#r}
    while ((s>$2&&c<${#p[*]}-1))
    do
        d=${p[c]}
        n=1;[[ $d = .* ]]&&n=2
        ((s-=${#d}-n))
        p[c++]=${d:0:n}
    done
    echo "${p[*]}"
}

#$(date +%H:%M) 
## COLOURS ##
#GREY=\[\e[1;30m\]

# change terminal style
#PS1='\e[0;33m\w\n\e[0m'
#PS1=$PS1'\e[0;33m[ \W$(__git_ps1 " (%s)") ]\e[0m\$ '
# dark colors background terminal
#PS1='\[\e[0;32m\]\w\[\e[0m\]\n\e[0;36m\][ \W$(__git_ps1 " (%s)") ]\[\e[0m\]\$ '
#PS1='\[\e[0;32m\] $(_dir_chomp \w 20) \[\e[0m\]\e[0;36m\][ \W$(__git_ps1 " (%s)") ]\[\e[0m\]\$ '
# bright colors background terminal
#PS1='\[\e[1;32m\] $(_dir_chomp \w 20) \[\e[0m\]\e[0;31m\][ \W$(__git_ps1 " (%s)") ]\[\e[0m\]\$ '
#30m and 36m is good

#export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

#########################
##      ALIASES        ##
#########################

alias loc='cd /usr/local/workspace'
alias pipfiles='cd /usr/local/lib/python2.7/site-packages'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias gs='git status'
alias gpo='git pull origin'
alias apachestart='sudo apachectl -k start'
alias apachestop='sudo apachectl -k stop'
alias store='cd /usr/local/workspace/alicetwelve/web2py/applications/store'
alias sshaws='ssh -o "UserKnownHostsFile /dev/null"'
alias sha256='shasum -a 256'
alias sha1='shasum -a 1'
alias tmux='tmux -2'
alias please='ssh !!'

#eval "$(rbenv init -)"
#alias b=‘bundle exec’
WS='/usr/local/workspace'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export NODE_PATH="/usr/local/lib/node"


#########################
##      virtualenv     ##
#########################
export WORKON_HOME=$HOME/.virtualenvs
export PIP_DOWNLOAD_CACHE=$HOME/.pip_packages
#export PROJECT_HOME=$HOME/
#source "/usr/local/share/python/virtualenvwrapper.sh"


#########################
##      ENVs           ##
#########################
export ANDROID_HOME=/Users/nickma/Documents/android-sdk-macosx
PATH="/Users/nickma/Documents/android-sdk-macosx/tools:$PATH"


#########################
##      FUNCs          ##
#########################

function git_push_new {
    git push -u origin $1
}

function git_new_br {
    git co -b $1 && git_push_new $1
}

# added by Anaconda3 2.2.0 installer
export PATH="$HOME/anaconda/bin:$PATH"
