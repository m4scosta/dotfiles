#!/usr/bin/env bash

function apt_install() {
  apt install -y "$@"
}

function setup_apt() {
  apt update && apt -y upgrade
  apt_install apt-transport-https
  apt_install ca-certificates
  apt_install software-properties-common
}

function install_docker() {
  command -v docker >/dev/null 2>&1 && echo "Docker already installed" && return

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  apt update -q
  apt install docker-ce
}

function install_nvim() {
  command -v docker >/dev/null 2>&1 && echo "NeoVim already installed" && return

  add-apt-repository ppa:neovim-ppa/stable && \
    apt update && \
    apt_install neovim exuberant-ctags silversearcher-ag && \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}


[ "$USER" != root ] && echo "You must run as root" && exit 1


setup_apt && \
  apt_install curl gimp git htop meld nload pgadmin3 tree cmake python3 python3-dev && \
  install_docker && \
  install_nvim && \
  apt -y autoclean && \
  apt -y autoremove
