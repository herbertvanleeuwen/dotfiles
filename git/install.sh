#!/usr/bin/env sh

set -e

ln -sf "${DOTFILES}/git/.gitconfig" "${HOME}/.gitconfig"
success "linked gitconfig"