sudo apt update && sudo apt upgrade

# Unneeded packages(Ubuntu gnome 16.04.4)
sudo apt remove libreoffice-* gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects gnomine gnome-calendar gnome-calculator gnome-contacts gnome-getting-started-docs* gnome-maps gnome-logs gnome-music gnome-sushi evolutionsudo apt update && sudo apt upgrade
sudo apt remove libreoffice-* gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects gnomine gnome-calendar gnome-calculator gnome-contacts gnome-getting-started-docs* gnome-maps gnome-logs gnome-music gnome-sushi evolution firefox xterm

sudo apt install git build-essential g++ cmake cmake-curses-gui openssl pkg-config zlib1g-dev libuv-dev ffmpeg vlc imagemagick vim-gnome ranger gimp kazam zsh curl libevent-dev ncurses-base libncurses5-dev libncursesw5-dev xclip dconf-cli autoconf automake ibus-mozc snapd jq

git submodule init && git submodule update

export DOTFILES=$HOME/dotfiles

# nix
curl https://nixos.org/nix/install | sh

# VSCode(https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions)
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install apt-transport-https
sudo apt update
sudo apt install

# hyper
# There is a nix package but it fetches old one
# https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/misc/hyper/default.nix
curl -LO https://github.com/zeit/hyper/releases/download/2.1.0/hyper_2.1.0_amd64.deb
sudo dpkg -i hyper_2.1.0_amd64.deb
ln -s $HOME/dotfiles/hyper/.hyper.js $HOME/
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /opt/Hyper/hyper 50

# zsh
ln -s $HOME/dotfiles/zsh/.zshrc $HOME/
ln -s $HOME/dotfiles/zsh/.zprofile $HOME/
ln -s $HOME/dotfiles/zsh/prezto/.zpreztorc $HOME/
chsh -s /usr/bin/zsh

# tmux
cd $DOTFILES/tmux/
./autogen.sh
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

# Directory names
LANG=C xdg-user-dirs-gtk-update
