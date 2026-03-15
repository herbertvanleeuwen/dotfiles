#!/usr/bin/env sh

set -e

VSCODE_USER_DIR="${HOME}/Library/Application Support/Code/User"

if [ ! -d "${VSCODE_USER_DIR}" ]; then
  info "VS Code not installed, skipping vscode settings"
  exit 0
fi

ln -sf "${DOTFILES}/vscode/settings.json" "${VSCODE_USER_DIR}/settings.json"
success "linked vscode settings.json"
