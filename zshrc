# Path to your oh-my-zsh installation.
export ZSH=/home/vagrant/.oh-my-zsh

ZSH_THEME="powerline"
plugins=(git)

# User configuration
POWERLINE_DETECT_SSH="true"
POWERLINE_NO_BLANK_LINE="true"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_RIGHT_A_COLOR_FRONT="white"
POWERLINE_RIGHT_A_COLOR_BACK="gray"

source $ZSH/oh-my-zsh.sh
source $HOME/.zprofile

HISTFILE=$HOME/.zsh-history

