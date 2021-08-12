# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="juanghurtado"
#source $ZSH/custom/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
ZSH_THEME="camuthig"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export PATH="$HOME/.local/bin:/opt:$PATH"
plugins=(git github git-flow composer npm sudo python pyenv laravel5 gradle mvn tmux poetry zsh-vim-mode tmuxinator zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
if [ -f "$HOME/.zshrc.local.pre" ]; then
    source ~/.zshrc.local.pre
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

source ~/.aliases
export EDITOR=vim

# Google Cloud
# If the system is working with Python3, then GCloud needs to point to a version of Python2.7. To make this
# work, be sure to add the CLOUDSDK_PYTHON value to an appropriate Python binary
if [ -x "$(command -v gcloud)" ]; then
    gcloud_root=$(gcloud info --format flattened | grep installation.sdk_root | cut -d' ' -f2- | xargs)
    if [ -f "$gcloud_root/completion.zsh.inc" ]; then
        source "$gcloud_root/completion.zsh.inc"
    fi
fi
# end Google Cloud

# Python
# Quiet warnings
export PYTHONWARNINGS="ignore"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
if [ -d "$HOME/.poetry" ]; then
    export PATH="$HOME/.poetry/bin:$PATH"
fi

if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

# Rust
if [ -d "$HOME/.cargo" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Ruby
if [ -f '/etc/profile.d/rvm.sh' ]; then
    source /etc/profile.d/rvm.sh
fi

# Golang
if [ -x "$(command -v go)" ]; then
    export GOPATH="$HOME/go"
    export PATH="/usr/lib/go/bin:$PATH"
    export PATH="$GOPATH/bin:$PATH"
fi

# Node
if [ -d "$HOME/.nvm" ]; then
	export NVM_DIR="$HOME/.nvm"
	\. "$NVM_DIR/nvm.sh"  # This loads nvm
fi


# Kitty
if [ -x "$(command -v kitty)" ]; then
    autoload -Uz compinit
    compinit
    # Completion for kitty
    kitty + complete setup zsh | source /dev/stdin
fi

# Windows WSL Specific
if [ -d '/mnt/wsl' ]; then
    export BROWSER='/mnt/c/Program Files/Mozilla Firefox/firefox.exe'
fi

# Turn on vim mode
bindkey -v
export KEYTIMEOUT=1

if [ -f "$HOME/.zshrc.local.post" ]; then
    source ~/.zshrc.local.post
fi

