source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

source_if_exists $HOME/.env.sh
source_if_exists $DOTFILES/zsh/aliases.zsh

# add ssh ids
#ssh-add ~/.ssh/id_github
#Ssh-add ~/.ssh/id_github.pub

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Set theme and theme config
ZSH_THEME="spaceship"
export SPACESHIP_CONFIG=$DOTFILES/zsh/spaceship.zsh

# Set language variables
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Import ZSH plugins for the environment
# Apple Silicon
if [ $(arch) = "arm64" ]; then
  plugins=(docker docker-compose pyenv git macos pylint python poetry direnv)
else
  # VS Code Containers
  if [[ ${REMOTE_CONTAINERS} ]] ; then
    plugins=(docker git)
  else
    plugins=(docker docker-compose pyenv git macos pylint python poetry direnv)
  fi
fi
source $ZSH/oh-my-zsh.sh

# Pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# hook direnv
eval "$(direnv hook zsh)"

# User configuration
# Preferred editor for local and remote sessions
export EDITOR='code' 

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.3.5
