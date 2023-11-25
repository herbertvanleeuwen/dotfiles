#!/usr/bin/env sh

set -e

ln -sf "${DOTFILES}/zsh/rc.zsh" "${HOME}/.zshrc"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "${DOTFILES}/zsh/themes/spaceship-prompt" --depth=1

ln -s "${DOTFILES}/zsh/themes/spaceship-prompt/spaceship.zsh-theme" "${HOME}/.oh-my-zsh/themes/spaceship.zsh-theme"

chsh -s $(which zsh)
