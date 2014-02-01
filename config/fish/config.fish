# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_cleanstate ''
set __fish_git_prompt_char_dirtystate 'x'
set __fish_git_prompt_char_stagedstate 's'
set __fish_git_prompt_char_stashstate '-'
set __fish_git_prompt_char_upstream_ahead 'ua'
set __fish_git_prompt_char_upstream_behind 'ub'

function git_branch
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function ps1_pwd
  echo $PWD | sed -e "s|^$HOME|~|" -e "s|^/private||"
end

function git_unpushed
  echo (git cherry -v "@{upstream}" ^/dev/null)
end

function _is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set last_status $status
  set_color $fish_color_cwd
  
  set -l normal (set_color normal)
  set -l magenta (set_color -o magenta)
  set -l yellow (set_color yellow)
  set -l cyan (set_color cyan)
  set -l red (set_color -o red)

  set -l arrow ' >>'

  printf '%s' (ps1_pwd)
  
  set_color normal

  if [ (git_branch) ]
    printf ' git:(%s)' (git_branch)

    if [ (git_unpushed) ]
      set git_info "$git_info$normal with$magenta unpushed"
    end
  end

  echo -e $arrow $normal
end

set PATH "/bin"
set PATH "/sbin" $PATH
set PATH "/usr/bin" $PATH
set PATH "/usr/sbin" $PATH
test -d "/usr/local/bin"; and set PATH "/usr/local/bin" $PATH
test -d "/usr/local/sbin"; and set PATH "/usr/local/sbin" $PATH
test -d "$HOME/.rbenv/shims"; and set -gx PATH "$HOME/.rbenv/shims" $PATH
test -d "$HOME/bin"; and set PATH "$HOME/bin" $PATH

#rbenv
set -gx CC = gcc
set brew_rbenv "$HOME/.rbenv/shims"
set -gx RBENV_ROOT "$HOME/.rbenv/"
rbenv rehash > /dev/null ^&1

set -g -x TERM "xterm-256color"
set -g -x VISUAL vim
set -g -x EDITOR vim
set -g -x PAGER less

set -g GOROOT "/usr/local/Cellar/go/current"
set -g GOPATH "$HOME/code/go"

set -g LC_ALL="en_US.UTF-8"
set -g LANG="en_US.UTF-8"

#kill the fish 'help' greeting ...
set -g -x fish_greeting '' 

#set -g -x GREP_OPTIONS '--color=auto'

# ALIASES
function tracert; traceroute; end
alias ls="ls -alG"
alias py="python"
