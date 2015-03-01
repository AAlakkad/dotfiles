#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# paths
export PATH=$PATH:~/npm/bin:~/.composer/vendor/bin:./wp-content/vendor/bin:./vendor/bin

# default editor
export EDITOR=vim

# aliases
for file in ~/.dotfiles/.aliases/*.zsh; do
  source $file
done

# Source .profile
source ~/.profile

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
