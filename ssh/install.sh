#!/usr/bin/env sh

set -e

# SSH client config only. Private keys are never stored in this repo:
# copy them into ~/.ssh by hand (e.g. ~/.ssh/home-server, chmod 600).
mkdir -p "${HOME}/.ssh"
chmod 700 "${HOME}/.ssh"
ln -sf "${DOTFILES}/ssh/config" "${HOME}/.ssh/config"
success "linked ssh config"
