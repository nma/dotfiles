function _dir_chomp () {
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

# continuously runs a given command maintaining colorization and formatting in output
# input: sleep time between executions, command to run
function watcher()
{
    WATCHERTIME=$1
    WATCHERFILE=/tmp/watcher$$
    shift
    while true; do
        WATCHERHEIGHT=$(($LINES - 5))
        ( eval $* ) | tail -n ${WATCHERHEIGHT} > ${WATCHERFILE} 2>/dev/null
        clear
        /bin/echo -n "Every ${WATCHERTIME} seconds - "
        date
        /bin/echo
        cat ${WATCHERFILE}
        \rm -f ${WATCHERFILE}
        /bin/echo
        /bin/echo "=="
        sleep ${WATCHERTIME}
    done
}

alias tmux='TERM=xterm tmux'
alias pyjson='python -mjson.tool'
alias serve_it='python -m SimpleHTTPServer'
