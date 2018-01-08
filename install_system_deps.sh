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

function install_rvm() {
  command -v rvm >/dev/null 2>&1 && echo "rvm already installed" && return

  gpg --keyserver hkp://keys.gnupg.net \
    --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  apt-add-repository -y ppa:rael-gc/rvm
  apt update
  apt_install rvm
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

  add-apt-repository ppa:neovim-ppa/stable
  apt update
  apt_install neovim exuberant-ctags silversearcher-ag
}

[ "$USER" != root ] && echo "You must run as root" && exit 1

setup_apt

apt_install \
  curl \
  exuberant-ctags \
  gimp \
  git \
  htop \
  libpq-dev \
  meld \
  nload \
  pgadmin3 \
  postgresql-9.6 \
  postgresql-contrib-9.6 \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  tree

install_docker
install_rvm
install_nvim

apt -y autoclean && apt -y autoremove
