# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG $HOME/.config/omf

set fish_theme agnoster

set fish_plugins theme peco

function peco_select_history
    if set -q $argv
        history | peco | read -l line; and commandline $line
    else
        history | peco --query $argv | read -l line; and commandline $line
    end

    commandline -f repaint
end

function fish_user_key_bindings
  bind \cr peco_select_history
  bind \ce peco_select_repository
end

function peco_select_repository
    ghq list -p | peco --select-1 | read -l line; and builtin cd $line

    commandline -f repaint
end
