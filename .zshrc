# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export PYENV_VIRTUALENV_DISABLE_PROMPT=0
#add ssh ids
#ssh-add ~/.ssh/id_github
#Ssh-add ~/.ssh/id_github.pub

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Export Spaceship theme variables
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_VENV_SYMBOL="🐍 "


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Set language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Apple Silicon
if [ $(arch) = "arm64" ]; then
  plugins=(docker docker-compose git macos pyenv pylint python poetry)
else
  # VS Code Containers
  if [[ ${REMOTE_CONTAINERS} ]] ; then
    plugins=(docker git)
  else
    plugins=(docker docker-compose git macos pyenv pylint python poetry)
  fi
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias startvenv="source ./venv/bin/activate"
alias pi="ssh pi@192.168.1.190"


export PIP_REQUIRE_VIRTUALENV=true

gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

gpip3() {
    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}


# Pyenv setup
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/herbertvanleeuwen/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/herbertvanleeuwen/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/herbertvanleeuwen/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/herbertvanleeuwen/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.poetry/bin:$PATH"
