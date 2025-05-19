# Bash helper functions
#
# Add to PATH if not already there
# If second argument is "pre" then prepend, else append
pathadd() {
    if ! [[ $PATH =~ (^|:)$1($|:) ]]; then
        if [[ "$2" == "pre" ]]; then
            PATH="$1:$PATH"
        else
            PATH="$PATH:$1"
        fi
    fi
}

# Grep process
psg () {
    ps -ef | grep -E "(CMD|$1)" | grep -v grep
}

# Set proxy
proxy (){
    if [ $(hostname) == 'padouch' ]; then
        HTTP_PROXY=http://localhost:3128
    else
        HTTP_PROXY=http://http-proxy.cezdata.corp:8080
    fi
    HTTPS_PROXY=$HTTP_PROXY;
    NO_PROXY="10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,127.0.0.0/8,127.0.0.1,.corp,localhost"
    http_proxy=$HTTP_PROXY;
    https_proxy=$HTTP_PROXY
    no_proxy=$NO_PROXY
    export HTTP_PROXY HTTPS_PROXY NO_PROXY http_proxy https_proxy no_proxy
}

# Set docker server via SSH tunnel
dockertun () {
    ssh -fNL 2375:localhost:2375 -F $HOME/.ssh/config_qshorakmar $1
    export DOCKER_HOST=tcp://localhost:2375
    echo "Using docker server at tcp://$1:2375 via SSH tunnel."
}


# Get credentials
_getcred() {
    if [[ "$1" == qs* ]]; then
        if [[ -r $HOME/.cifs/corp_qs ]]; then
            sed -ne "/${1#qs}/ s/.*=//p" $HOME/.cifs/corp_qs
        elif [[ $1 == 'qsuser' ]]; then
            echo 'qshorakmar'
        fi
    elif [[ -r $HOME/.cifs/corp ]]; then
        sed -ne "/$1/ s/.*=//p" $HOME/.cifs/corp
    elif [[ "$1" == 'user' ]]; then
        echo horakmar
    fi
}


# Obsolete
vncvia() {
    vncviewer -via $1 localhost:0
}


