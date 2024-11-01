#!/bin/bash

# test toho zda tento skript jede pod účtem root
# zjistíme si id aktuálního uživatele
SUID=$(id | cut -d " " -f 1 | cut -d "=" -f 2 | cut -d "(" -f 1)
if [ ! "$SUID" ==  "0" ]; then
    echo "Must run this as root!"
    exit 1
fi

apt update -y
if [ $? -ne 0 ]; then
    echo "apt update: failed."
    exit 1
fi

apt upgrade -y
if [ $? -ne 0 ]; then
    echo "apt upgrade: failed."
    exit 1
fi

apt install -y \
    stow \
    timeshift \
    libnotify-bin \
    distrobox \
    openconnect \
    network-manager-openconnect \
    ripgrep \
    fzf \
    fd-find \
    git git-flow \
    gpg \
    flatpak \
    podman \
    kdesvn \
    wl-clipboard \
    xclip \
    build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl git \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

if [ $? -ne 0 ]; then
    echo "apt install batch 1: failed."
    exit 1
fi

# flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install com.logseq.Logseq io.dbeaver.DBeaverCommunity
if [ $? -ne 0 ]; then
    echo "apt install batch 1: failed."
    exit 1
fi

# install eza
mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" |  tee /etc/apt/sources.list.d/gierens.list
chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
apt update -y

apt install -y eza
if [ $? -ne 0 ]; then
    echo "apt install eza: failed."
    exit 1
fi

# wezterm
curl -fsSL https://apt.fury.io/wez/gpg.key | gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | tee /etc/apt/sources.list.d/wezterm.list
apt update -y
apt install -y wezterm

if [ $? -ne 0 ]; then
    echo "apt install wezterm: failed."
    exit 1
fi

# setup podman
if grep -qF "docker.io" /etc/containers/registries.conf; then
    echo "docker.io already in /etc/containers/registries.conf"
else
    echo "[[registry]]" >> etc/containers/registries.conf
    echo "location = \"docker.io\"" >> etc/containers/registries.conf
fi

# update gitu
add-apt-repository ppa:git-core/ppa
apt update -y
apt upgrade -y

# dependence pro azure devops
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

AZ_DIST=$(lsb_release -cs)
echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources

apt update -y
apt install -y azure-cli

if [ $? -ne 0 ]; then
    echo "apt install azure-cli: failed."
    exit 1
fi

az extension add --name azure-devops


