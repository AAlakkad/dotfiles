# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(bgnotify git composer common-aliases git-extras tmux vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# paths
export PATH=$PATH:~/npm/bin:~/.composer/vendor/bin:./wp-content/vendor/bin:./vendor/bin

# default editor
export EDITOR=vim

# aliases
source ~/.aliases

# Source .profile
source ~/.profile

~/.dotfiles/eyes-notifications.sh&

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
