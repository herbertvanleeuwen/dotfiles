#!/usr/bin/env sh

set -e

source ./bin/generic_shell_functions

###
# Installation of packages, configurations, and dotfiles.
### 

#Setup environment file
echo $(pwd)
DOTFILES=$(pwd -P)
export DOTFILES;
./bin/env_file

###
# Install dependencies
###
./bin/dotfiles_install install zsh
./bin/dotfiles_install install git
#./bin/dotfiles install omz
#./bin/dotfiles install brew
#./bin/dotfiles install vscode
#./bin/dotfiles install github
#./bin/dotfiles install node
#./bin/dotfiles install mongodb
#./bin/dotfiles install php
#./bin/dotfiles install starship
#./bin/dotfiles install tmux
#./bin/dotfiles install vim
