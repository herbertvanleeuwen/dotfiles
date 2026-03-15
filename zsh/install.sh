#!/usr/bin/env sh

set -e

# Install oh-my-zsh if not already present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  info "Installing oh-my-zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  success "oh-my-zsh installed"
else
  info "oh-my-zsh already installed, skipping"
fi

ln -sf "${DOTFILES}/zsh/rc.zsh" "${HOME}/.zshrc"
success "linked .zshrc"

ln -sf "${DOTFILES}/zsh/zprofile" "${HOME}/.zprofile"
success "linked .zprofile"

# Clone spaceship-prompt only if not already present
if [ ! -d "${DOTFILES}/zsh/themes/spaceship-prompt" ]; then
  info "Cloning spaceship-prompt..."
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "${DOTFILES}/zsh/themes/spaceship-prompt" --depth=1
  success "spaceship-prompt cloned"
else
  info "spaceship-prompt already cloned, skipping"
fi

ln -sf "${DOTFILES}/zsh/themes/spaceship-prompt/spaceship.zsh-theme" "${HOME}/.oh-my-zsh/themes/spaceship.zsh-theme"
success "linked spaceship theme"

chsh -s $(which zsh)
