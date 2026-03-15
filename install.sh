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
# Install Homebrew if not present, then install all packages from Brewfile
###
if ! command -v brew >/dev/null 2>&1; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  success "Homebrew installed"
else
  info "Homebrew already installed, skipping"
fi

info "Running brew bundle..."
brew bundle
success "brew bundle complete"

###
# Install dependencies
###
./bin/dotfiles_install install zsh
./bin/dotfiles_install install git
./bin/dotfiles_install install vscode
