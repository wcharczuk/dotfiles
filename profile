#{
    #brew {
        if [ -f `brew --prefix`/etc/bash_completion ]; then
            . `brew --prefix`/etc/bash_completion
        fi
        #. `brew --prefix`/etc/profile.d/z.sh
    #}
    #git {
        export PS1='\w$(__git_ps1 ":(%s)") >> '  
    #}
#}

#env vars {
  export PATH="/usr/local/share/npm/bin:$PATH"
  export PATH="/usr/local/sbin:$PATH"
  export PATH="~/bin:$PATH"
  export EDITOR="vim"
  export TERM="xterm-256color"
  
  #go stuff
  export GOROOT="/usr/local/Cellar/go/current/libexec"
  export PATH="$PATH:$GOROOT/bin"
  export GOPATH="$HOME/.go/"
  export PATH="$PATH:$GOPATH/bin"
  
  #this is rail specific
  export LC_ALL="en_US.UTF-8"
  export LANG="en_US.UTF-8"
  #set -o vi   #set's terminal to behave like vim
#}

#aliases {
  #ls {
    alias ls="ls -a -l -G" 
    alias lss="ls -G"
  #}
  #git {
    alias gs='git status '
    alias ga='git add ' 
    alias gb='git branch '
    alias gc='git commit '
    alias gd='git diff '
    alias gco='git checkout '
    alias got='git '
    alias get='git '
  #}
  #go {
    alias go_build_debug='go build -gcflags "-N -l"'
    alias go_build_release='go build -ldflags "-s"'
  #}
  alias tracert="traceroute"
  alias ab="ab -r"
  alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
  alias py="python"
  #alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
  alias lod="echo ಠ_ಠ"
  alias src="source-highlight-esc.sh"
  alias scroll="less -R"
#}

#functions {
#function fname() { find . -iname "*$@*"; }
#}

#rbenv stuff {
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi
#}
