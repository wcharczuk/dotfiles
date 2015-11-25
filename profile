
# go stuff {
    export GOPATH=$HOME/go
    export GOROOT=/usr/local/go
#}
    
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

export EDITOR="vim"

#{
    export LC_COLLATE="C"
    export LC_ALL="C.UTF-8"
    export LANG="en_US.UTF-8"
#}

#alias {
    alias ls="ls -a -l --color"
    alias py="python"
    alias ..="cd .."
    alias v="vim"
    alias e="emacs"

    alias gs="git status"
    alias gco="git checkout"
    alias gcheck="git checkout"
    alias ga="git add"
    alias grhh="git reset hard head"

#}
