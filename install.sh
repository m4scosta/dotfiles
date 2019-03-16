#!/usr/bin/env bash

function install() {
  rsync \
    --exclude "*.swp" \
    --exclude ".git/" \
    --exclude ".gitignore" \
    --exclude "README.md" \
    --exclude "install.sh" \
    --exclude "install_system_deps.sh" \
    --exclude ".bashrc" \
    -av . ~

  if ! grep -q "# DOTFILES INCLUSION" ~/.bashrc; then
    echo "# DOTFILES INCLUSION" >> ~/.bashrc
    echo ". ~/.bashrc-ext" >> ~/.bashrc
  fi
}

install
