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

alias proxy?='env | grep -i proxy && echo -e "\nexport HTTP_PROXY HTTPS_PROXY NO_PROXY http_proxy https_proxy no_proxy"'
alias unproxy="unset HTTP_PROXY HTTPS_PROXY NO_PROXY http_proxy https_proxy no_proxy"

# Samba
alias smbwho="ssh -F $HOME/.ssh/config_qshorakmar xshare smbwho"

# Net
alias vpn="sudo vpn"
alias vpn7="sudo vpn"
alias wifiadr="sudo dhcpcd wlan0"

# Docker
alias dockrm='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias dockrmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias drmall='docker rm -f $(docker ps -a -q)'

# PKI
# Replaced by python program
# alias crt="openssl x509 -noout -text -in"

# Syntax highlight
alias ccat="pygmentize -g"

# Python development
alias venv="source .venv/bin/activate"
alias pyco="jupyter console"
