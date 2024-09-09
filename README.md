- [Závislosti](#závislosti)
- [Akce po instalaci](#akce-po-instalaci)
  - [Python tools](#python-tools)


# Závislosti

```bash
sudo apt install stow git
```

# Akce po instalaci

Z repozitářů:

```bash
sudo apt install timeshift
sudo apt install stow
sudo apt install distrobox
sudo apt install openconnect network-manager-openconnect
sudo apt install ripgrep fzf
sudo apt install git-flow
```

Flatpak - instaluji:

- DBeaver a Logseq.
- Wez's terminal, https://wezfurlong.org/wezterm/install/linux.html

```bash
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install com.logseq.Logseq io.dbeaver.DBeaverCommunity
sudo flatpak install flathub org.wezfurlong.wezterm
```


Krusader pro správu souborů

```bash
sudo apt install krusader
```

Podman

```
sudo apt install podman
sudo echo "[[registry]]" >> etc/containers/registries.conf
sudo echo "location = \"docker.io\"" >> etc/containers/registries.conf
```

Oracle instant client - následující závislost.

```bash
sudo apt-get install libaio1
```

SVN

```bash
sudo apt intall kdesvn
```

oh-my-bash - pozor, likviduje `~/.bashrc`.

```
bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
```


## Python tools

Pyenv instalujeme pod lokálním účtem. Ne z root účtu.

```bash
curl https://pyenv.run | bash
```

Python build dependencies.

```bash
sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

Následně korekce konfigurace podle návodu z Pyenvu.

Instalace verze pythonu.

```bash
pyenv install 3.12.3
pyenv global 3.12.3
```
