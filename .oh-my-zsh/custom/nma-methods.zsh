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
alias pstart='~/pomodoro-counter.py'
alias urldecode='python -c "import sys, urllib as ul; \
    print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; \
    print ul.quote_plus(sys.argv[1])"'

function dockerclean()
{
    if [[ "$1" == "c" ]]; then
        STATUS='created'
    else
        STATUS='exited'
    fi
    echo "cleaning $STATUS..."
    docker rm -v $(docker ps -q -f status=$STATUS)
}


