#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export DOTFILES=$HOME/dotfiles

# antigen
source $DOTFILES/antigen/antigen.zsh
antigen bundle sorin-ionescu/prezto

# zsh起動時にtmux起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux

# ranger
alias ranger='TERM=xterm-256color ranger' # To use solarized theme :(

# Use anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH=/home/e_ntyo/.local/bin:$PATH

# VEDA(Vulkan SDK)
export PATH=$HOME/VulkanSDK/1.0.68.0/x86_64/bin/:$PATH

# dircolors
eval `dircolors /path/to/dircolorsdb`
