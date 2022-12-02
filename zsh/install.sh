#!/usr/bin/env sh

set -e

ln -sf "${DOTFILES_LOCATION}/zsh/.zshrc" "${HOME}/.zshrc"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "${DOTFILES_LOCATION}/zsh/themes/spaceship-prompt" --depth=1

ln -s "${DOTFILES_LOCATION}/zsh/themes/spaceship-prompt/spaceship.zsh-theme" "${HOME}/.oh-my-zsh/themes/spaceship.zsh-theme"

chsh -s $(which zsh)
