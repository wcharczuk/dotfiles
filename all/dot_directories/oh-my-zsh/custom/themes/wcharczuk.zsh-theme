autoload -Uz vcs_info

THEME_GIT_CLEAN="✔"
THEME_GIT_DIRTY="✘"
THEME_GIT_ADDED="✚"
THEME_GIT_MODIFIED="✹"
THEME_GIT_DELETED="✖"
THEME_GIT_UNTRACKED="✭"
THEME_GIT_RENAMED="➜"
THEME_GIT_UNMERGED="═"

THEME_GIT_AHEAD="⬆"
THEME_GIT_BEHIND="⬇"
THEME_GIT_DIVERGED="⬍"

THEME_GIT_STATUS="%F{white} %F{black}%K{white}"$'$(git_prompt_status)'" %k"

RPROMPT_BASE="%~%f"

export PS1="%F{green}${SSH_TTY:+%n@%m}%f%B${SSH_TTY:+:}%b%F{blue}%m %(?..%F{yellow}%B!%b%f) ('$(git_prompt_info)') %F{red}%B%(!.#.$)%b%f "
export RPROMPT="%F{blue}$RPROMPT_BASE%f$THEME_GIT_STATUS"