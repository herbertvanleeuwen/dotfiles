#!/usr/bin/env sh

set -e

source ./bin/generic_shell_functions

###
# Installation of packages, configurations, and dotfiles.
### 

#Setup environment file
DOTFILES=$(pwd -P)
export DOTFILES

./bin/env_file

###
# Install dependencies
###
./bin/dotfiles_install install zsh
./bin/dotfiles_install install git
