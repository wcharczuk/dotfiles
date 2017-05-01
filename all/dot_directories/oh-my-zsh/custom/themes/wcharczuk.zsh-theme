autoload -Uz vcs_info

zstyle ':vcs_info:git*' check-for-changes true 
zstyle ':vcs_info:git*' formats "%b %m%u%c" 

precmd() {
    vcs_info
}

setopt prompt_subst

RPROMPT_BASE="%~%f"

export PS1="%F{red}%B%(!.#.$)%b%f "
export RPROMPT='%F{blue}$RPROMPT_BASE%f %F{red}${vcs_info_msg_0_}%f'
