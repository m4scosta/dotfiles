#!/usr/bin/env bash

# TODO: install .bashrc
# TODO: install .aliases/git.sh
# TODO: install plug

function install() {
  rsync \
    --exclude "*.swp" \
    --exclude ".git/" \
    --exclude ".gitignore" \
    --exclude "README.md" \
    --exclude "install.sh" \
    --exclude "install_system_deps.sh" \
    -av . ~
}

install
