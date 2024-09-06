- [Závislosti](#závislosti)
- [Akce po instalaci](#akce-po-instalaci)
    - [Podman a distrobox](#podman-a-distrobox)
    - [Teradata](#teradata)
  - [Python tools](#python-tools)


# Závislosti

```bash
sudo apt install stow git
```

# Akce po instalaci

Základní nástroje

```bash
sudo apt install timeshift
sudo apt install stow
sudo apt install zsh
sudo apt install yakuake
sudo apt install openconnect network-manager-openconnect
```

Flatpak - instaluji:

- DBeaver a Logseq.
- Wez's terminal, https://wezfurlong.org/wezterm/install/linux.html - nicméně, zatím nejsem spokojený. Chci vysouvací konzoli, chci mít možnost mít jednu instanci na všech desktopech. Yakuake tuhle potřebu zatím plní lépe.

```bash
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install com.logseq.Logseq io.dbeaver.DBeaverCommunity
sudo flatpak install flathub org.wezfurlong.wezterm
```

Krusader pro správu souborů.

```bash
sudo apt install krusader
```

### Podman a distrobox


```bash
sudo apt install podman
sudo apt install distrobox
sudo echo "[[registry]]" >> etc/containers/registries.conf
sudo echo "location = \"docker.io\"" >> etc/containers/registries.conf
```

### Teradata

TTUs - měl jsem problém s instalací z oficiálních instalačních souborů. Nefungují na Debianu, a to ani ubuntu based instalačky - 
paradoxně se opírají o `rpm`, a jeho instalace nepomohla. 

Řešením bylo provést instalaci distroboxu `sudo apt install podman && sudo apt install distrobox` a následně:

```bash
distrobox create fedora
distrobox ented fedora

# nyní jsem uvnitř kontejneru
# provedl jsem instalaci z cesty kde mám rozbaleno
cd ~/install/TeradataToolsAndUtilitiesBase
sudo ./setup.sh

# poslední krok je provést export binárky z kontejneru ven
# ve složce ~/sbin vzniká "wrapper" který zajistí run
# tenhle adresář mám v cestách
distrobox-export --bin /usr/bin/bteq --export-path ~/sbin
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