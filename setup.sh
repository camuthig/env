#! /bin/bash

# Install some basic necessities
echo Installing tools
if [ -f /etc/redhat-release ]; then
    sudo yum install -y \
        curl \
        vim \
        zsh \
        ssh \
        git \
        git-flow
fi
if [ -f /etc/lsb-release ]; then
    sudo apt-get install -y \
        curl \
        vim \
        zsh \
        ssh \
        git \
        git-flow
fi

# Install Vim Plug
echo Install VIM plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Set vimrc
echo Copying vimrc
cp vimrc ~/.vimrc

# Set gitconfig
echo Setting up gitconfig
cp gitconfig ~/.gitconfig

# Install oh-my-zsh
echo Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp zshrc ~/.zshrc

