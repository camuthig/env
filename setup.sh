#! /bin/bash

# Install some basic necessities
sudo apt-get install -y \
    vim \
    zsh \
    ssh \
    git \
    git-flow

# Install Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Set vimrc
cp vimrc ~/.vimrc

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp zshrc ~/.zshrc

# Set gitconfig
cp gitconfig ~/.gitconfig

