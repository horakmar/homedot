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

# Get credential
_getcred() {
    if [ -r $HOME/.cifs/corp ]; then
        sed -ne "/$1/ s/.*=//p" $HOME/.cifs/corp
    elif [ "$1" == 'user' ]; then
        echo horakmar
    fi
}
