# Functions
psg () {
    ps -ef | grep -E "(CMD|$1)" | grep -v grep
}

vncvia() {
    vncviewer -via $1 localhost:0
}

# Kubernetes
kuba () {
    kubectl $@ --all-namespaces
}

# Rest is in .kubectl_aliases

# Docker
alias dockrm='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias dockrmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias drmall='docker rm -f $(docker ps -a -q)'
dockertun () {
    ssh -fNL 2375:localhost:2375 -F $HOME/.ssh/config_qshorakmar $1
    export DOCKER_HOST=tcp://localhost:2375
    echo "Using docker server at tcp://$1:2375 via SSH tunnel."
}

# Salt
alias sarp='salt-call saltutil.refresh_pillar'
alias sapi='salt-call pillar.items'
alias sato='salt-call state.show_top'
alias saap='salt-call state.apply'

# Various useful aliases
alias psl="ps --width 300 axf | less -S"
alias mocd="mount /mnt/cdrom"
alias umcd="umount /mnt/cdrom"
alias taif="tail -f"
alias newmc="rxvt -e mc &"
alias newroot="rxvt -e su &"
alias bell="echo -en \"\a\""
alias beep="echo -en \"\a\""
alias mess="journalctl -xe"
alias fwstat="iptables --list -n -v | less -S"
alias vie="vim -R"
alias grepcfg='grep -Ev "^(#|$)"'
alias gvie="gvim -R"
alias lo="libreoffice"
alias pi10="ping -i 10"
alias jeu="journalctl -eu"
alias smount="sudo mount"
alias sumount="sudo umount"

# ls
alias l='ls --color=tty -AqCF'
alias l.='ls -d .[a-zA-Z]* --color=tty'
alias ll='ls -lA --color=tty'
alias ls='ls --color=tty'

# SSH
alias ussh="ssh -F $HOME/.ssh/config_qshorakmar"
alias uscp="scp -F $HOME/.ssh/config_qshorakmar"

# Proxy
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
alias proxy?='env | grep -i proxy && echo -e "\nexport HTTP_PROXY HTTPS_PROXY NO_PROXY http_proxy https_proxy no_proxy"'
alias unproxy="unset HTTP_PROXY HTTPS_PROXY NO_PROXY http_proxy https_proxy no_proxy"

# Samba
alias smbwho="ssh -F $HOME/.ssh/config_qshorakmar xshare smbwho"

# Net
alias vpn="sudo vpn"
alias vpn7="sudo vpn"
alias wifiadr="sudo dhcpcd wlan0"

# PKI
#alias crt="openssl x509 -noout -text -in "

# Syntax highlight
alias ccat="pygmentize -g"
