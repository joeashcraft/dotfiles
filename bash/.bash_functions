# Start an HTTP server from a directory, optionally specifying the port
function httpServer() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

function myip {
  curl -l ipinfo.io
}


function ii()   # get current host related info
{
  echo -e "\nYou are logged on \e[0;34m $HOSTNAME\e[m"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Memory stats :$NC " ; free -m
  echo
}

function psgrep() {
    ps -fp $(pgrep -d, "$*")
}


function title {
    echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD} "$*"\007"
}

## Edward's VENV Lite
function vactivate {
    PROJECT=$1
    source ${WORKON_HOME}/${PROJECT}/bin/activate
}


function vrm {
    PROJECT=$1
    rm -rf ${WORKON_HOME}/${PROJECT}
}


function mkvenv {
    PROJECT=$1
    if (( $# > 1 ))
    then
        virtualenv ${WORKON_HOME}/${PROJECT} -p $2
    else
        python3 -m venv ${WORKON_HOME}/${PROJECT}
    fi

    vactivate $1
}
##/Edward's VENV Lite
