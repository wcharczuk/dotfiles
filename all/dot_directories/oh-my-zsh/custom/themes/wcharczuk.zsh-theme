autoload -U colors
colors


THEME_GIT_CLEAN="✔"
THEME_GIT_DIRTY="✘"
THEME_GIT_ADDED="%F{green}✚%F{black}"
THEME_GIT_MODIFIED="%F{blue}✹%F{black}"
THEME_GIT_DELETED="%F{red}✖%F{black}"
THEME_GIT_UNTRACKED="%F{yellow}✭%F{black}"
THEME_GIT_RENAMED="➜"
THEME_GIT_UNMERGED="═"

ZSH_THEME_GIT_PROMPT_PREFIX="\ue0a0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="$THEME_GIT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$THEME_GIT_CLEAN"

ZSH_THEME_GIT_PROMPT_ADDED="$THEME_GIT_ADDED"
ZSH_THEME_GIT_PROMPT_MODIFIED="$THEME_GIT_MODIFIED"
ZSH_THEME_GIT_PROMPT_DELETED="$THEME_GIT_DELETED"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$THEME_GIT_UNTRACKED"
ZSH_THEME_GIT_PROMPT_RENAMED="$THEME_GIT_RENAMED"
ZSH_THEME_GIT_PROMPT_UNMERGED="$THEME_GIT_UNMERGED"
ZSH_THEME_GIT_PROMPT_AHEAD="⬆"
ZSH_THEME_GIT_PROMPT_BEHIND="⬇"
ZSH_THEME_GIT_PROMPT_DIVERGED="⬍"

THEME_GIT_STATUS="%F{white}%K{black}$(git_prompt_info)%b%f%k"

RPROMPT_BASE="%F{blue}%~%f"
setopt PROMPT_SUBST

# Anonymous function to avoid leaking NBSP variable.
function () {
  if [[ -n "$TMUX" ]]; then
    local NBSP=' '
    export PS1="%F{green}${SSH_TTY:+%n@%m}%f%B${SSH_TTY:+:}%b%F{blue}%1~%(?..%F{yellow}%B!%b%f) $THEME_GIT_STATUS %F{red}%B%(!.#.$)%b%f$NBSP"
    export ZLE_RPROMPT_INDENT=0
  else
    # Don't bother with ZLE_RPROMPT_INDENT here, because it ends up eating the
    # space after PS1.
    export PS1="%F{green}${SSH_TTY:+%n@%m}%f%B${SSH_TTY:+:}%b%F{blue}%1~%(?..%F{yellow}%B!%b%f) $THEME_GIT_STATUS %F{red}%B%(!.#.$)%b%f "
  fi
}

export RPROMPT=$RPROMPT_BASE
export SPROMPT="zsh: correct %F{red}'%R'%f to %F{red}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "

setopt autocd               # .. is shortcut for cd .. (etc)
setopt autoparamslash       # tab completing directory appends a slash
setopt autopushd            # cd automatically pushes old dir onto dir stack
setopt clobber              # allow clobbering with >, no need to use >!
setopt correct              # command auto-correction
setopt correctall           # argument auto-correction
setopt noflowcontrol        # disable start (C-s) and stop (C-q) characters
setopt nonomatch            # unmatched patterns are left unchanged
setopt histignorealldups    # filter duplicates from history
setopt histignorespace      # don't record commands starting with a space
setopt histverify           # confirm history expansion (!$, !!, !foo)
setopt ignoreeof            # prevent accidental C-d from exiting shell
setopt interactivecomments  # allow comments, even in interactive shells
setopt printexitvalue       # for non-zero exit status
setopt pushdignoredups      # don't push multiple copies of same dir onto stack
setopt pushdsilent          # don't print dir stack after pushing/popping
setopt sharehistory         # share history across shells
