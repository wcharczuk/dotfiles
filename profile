#{
    #brew {
        if [ -f `brew --prefix`/etc/bash_completion ]; then
            . `brew --prefix`/etc/bash_completion
        fi
        #. `brew --prefix`/etc/profile.d/z.sh
    #}
    #git {
        export PS1='\h:\w$(__git_ps1 ":(%s)")$ '  
    #}
#}

#env vars {
  export PATH="/usr/local/share/npm/bin:~/bin:/usr/local/Cellar/ruby/1.9.3-p0/bin:$PATH"
  export PATH="/usr/local/sbin:/usr/local/share/python:/usr/local/bin:$PATH"
  export PGDATA="/usr/local/var/postgres"
  export EDITOR="vim"
  export TERM="xterm-256color"
  export GOPATH="/Users/willcharczuk/code/go/"
  export GOROOT="/usr/local/Cellar/go/current"
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
  alias tracert="traceroute"
  alias ab="ab -r"
  alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
  alias py="python"
  #alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
  alias lod="echo ಠ_ಠ"
#}

#functions {
#function fname() { find . -iname "*$@*"; }
#}

#rbenv stuff {
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
#}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
