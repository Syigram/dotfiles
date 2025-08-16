user=sygram

# update & upgrade
sudo apt-get update
sudo apt-get upgrade

# Install essentials
sudo apt-get install -y curl wget build-essential nginx cmake stow git xclip \
 python3-dev zlib1g-dev exuberant-ctags linux-tools-common

# Install recommended for building Python (pyenv, asdf)
sudo apt-get install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev


# sudo apt install gnome-tweak-tool
# gsettings set org.gnome.mutter workspaces-only-on-primary false

# Day to day work
sudo apt-get install -y tmux zsh zsh-doc neovim silversearcher-ag

# alacritty
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt -y install alacritty

# install Hyper.js terminal -- needs verification #TODO broken step
# cd ~/Downloads
# curl -sL --proto-redir -all,https https://releases.hyper.is/download/deb | sudo dpkg -i

# verify that Menlo font is default in ~/.hyper.js
# nvim ~/.hyper.js
# hyper install hyper-snazzy

# make repositories dir
cd ~
mkdir -p ~/repositories
mkdir -p ~/.zsh

# import dotfiles
git clone git@github.com:Syigram/dotfiles.git ~/dotfiles
cd ~/dotfiles
make dotfiles && cd ~

# install zsh's zplug plugin manager
mkdir -p ~/.zplug/ && cd ~/.zplug/
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh


# install tmux's tpm plugin manager
# install tpm plugins with prefix + I
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install zsh Pure theme
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# install asdf
# git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.5

# or...
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"


# install asdf nodejs
#asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
#bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
#asdf plugin-add nodejs 13.1.0
#asdf global nodejs 13.1.0

# install asdf python
# export PYTHON_CONFIGURE_OPTS="--enable-shared"
#asdf plugin-add python
#asdf install python 3.7.4
#asdf global python 3.7.4

# change shell
sudo chsh -s /bin/zsh sygram

# configure YouCompleteMe
# cd ~/.vim/plugged/YouCompleteMe
# python3 ./install.py --clang-completer --ts-completer

sudo dpkg-reconfigure locales

# Install GitKraken
