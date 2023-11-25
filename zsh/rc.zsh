
source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists $HOME/.env.sh
source_if_exists $DOTFILES/zsh/aliases.zsh

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# add ssh ids
#ssh-add ~/.ssh/id_github
#Ssh-add ~/.ssh/id_github.pub

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PYENV_VIRTUALENV_DISABLE_PROMPT=0

# Set theme and theme config
ZSH_THEME="spaceship"
export SPACESHIP_CONFIG=$DOTFILES/zsh/spaceship.zsh

# Set language variables
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Import ZSH plugins
plugins=(docker docker-compose pyenv git macos pylint python poetry direnv)

# Apple Silicon
#if [ $(arch) = "arm64" ]; then
#  plugins=(docker docker-compose pyenv git macos pylint python poetry)
#else
#  # VS Code Containers
#  if [[ ${REMOTE_CONTAINERS} ]] ; then
#    plugins=(docker git)
#  else#    plugins=(docker docker-compose pyenv git macos pylint python poetry)
#  fi
#fi

source $ZSH/oh-my-zsh.sh

# Pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
#   eval "$(pyenv virtualenv-init -)"
# fi

# hook direnv
eval "$(direnv hook zsh)"


# User configuration
# Preferred editor for local and remote sessions
export EDITOR='code' 

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
