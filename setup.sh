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
        git-flow \
        tmux
fi
if [ -f /etc/lsb-release ]; then
    sudo apt-get install -y \
        curl \
        vim \
        zsh \
        ssh \
        git \
        git-flow \
        tmux
fi

# Add blank aliases file
touch ~/.aliases

# Add config directory
mkdir ~/.config

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

# Set Kitty config
echo Setting up kitty
cp kitty.conf ~/.config/kitty/kitty.conf

# Set tmux config
echo Seeting up tmux
cp tmux.conf ~/.tmux.conf

# Install oh-my-zsh
echo Installing oh-my-zsh
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp zshrc ~/.zshrc
cp -r -v oh-my-zsh/* ~/.oh-my-zsh/

# Install custom plugins
export ZSH_CUSTOM=~/.oh-my-zsh/custom
git clone https://github.com/softmoth/zsh-vim-mode.git $ZSH_CUSTOM/plugins/zsh-vim-mode
git clone https://github.com/darvid/zsh-poetry.git $ZSH_CUSTOM/plugins/poetry
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
