sudo apt update && sudo apt upgrade

# Unneeded packages(Ubuntu gnome 16.04.4)
sudo apt remove libreoffice-* gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects gnomine gnome-calendar gnome-calculator gnome-contacts gnome-getting-started-docs* gnome-maps gnome-logs gnome-music gnome-sushi evolutionsudo apt update && sudo apt upgrade
sudo apt remove libreoffice-* gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects gnomine gnome-calendar gnome-calculator gnome-contacts gnome-getting-started-docs* gnome-maps gnome-logs gnome-music gnome-sushi evolution firefox

sudo apt install git build-essential g++ cmake cmake-curses-gui openssl pkg-config zlib1g-dev libuv-dev ffmpeg vlc imagemagick vim-gnome ranger gimp kazam zsh curl libevent-dev ncurses-base xclip dconf-cli

git submodule init && git submodule update

export DOTFILES=$HOME/dotfiles

# zsh
# source $DOTFILES/antigen/antigen.zsh
# antigen bundle sorin-ionescu/prezto
# ln -s $HOME/.antigen/repos/.zprezto $HOME/
# ln -s $DOTFILES/zsh/prezto/.zpreztorc $HOME/
# setopt EXTENDED_GLOB
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#   ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done

ln -s $HOME/dotfiles/zsh/.zshrc $HOME/
ln -s $HOME/dotfiles/zsh/.zprofile $HOME/
chsh -s /usr/bin/zsh

# gnome-terminal-colors-solarized
cd $DOTFILES/gnome-terminal-colors-solarized
sh ./install.sh

# tmux
cd $DOTFILES/tmux/
sh ./autogen.sh
./configure && make && sudo make install
ln -s $HOME/dotfiles/.tmux.conf $HOME/

# vim

## install dein
cd /tmp
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
mkdir $HOME/.cache/dein
sh ./installer.sh $HOME/.cache/dein

## install additional color scheme
git clone https://github.com/lifepillar/vim-solarized8.git $HOME/.vim/pack/themes/opt/solarized8

ln -s $HOME/dotfiles/vim/.vimrc $HOME/

# Git
ln -s $HOME/dotfiles/.gitconfig $HOME/