#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export DOTFILES=$HOME/dotfiles

# antigen
source $DOTFILES/antigen/antigen.zsh
antigen use sorin-ionescu/prezto
antigen apply

# zsh起動時にtmux起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux

# ranger
alias ranger='TERM=xterm-256color ranger' # To use solarized theme :(

# Use anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - zsh)"

export PATH=/home/e_ntyo/.local/bin:$PATH

# VEDA(Vulkan SDK)
export PATH=$HOME/VulkanSDK/1.0.68.0/x86_64/bin/:$PATH

# dircolors
eval `dircolors ~/.dir_colors/dircolors`

# hub
fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

# Processing
export PATH=/home/e_ntyo/processing-3.3.6:$PATH

# aws-cli
# source /home/e_ntyo/.local/bin/aws_completer

# golang
export GOROOT=$HOME/.anyenv/envs/goenv/versions/1.9.7
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH=$GOBIN:$PATH
