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
sudo apt install ripgrep fzf fd-find
sudo apt install git-flow
```

Proč instaluji fzf, fd-find, eza, a batcat

- Po instalaci fzf je v terminálu možné po stistku `Ctrl+T` použít fuzzy find na úrovni jednotlivých souborů.
- Pro adresáře existuje zkratka `Alt+C`.


Eza, replacement za ls.

```bash
sudo apt install gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
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

Instalace upgraded gitu, nutná pro azure devops

```
sudo add-apt-repository ppa:git-core/ppa 
sudo apt update
sudo apt list --upgradable # zkontrolovat seznam... jeden z nich by měl být Git
sudo apt upgrade # aspoň na verzi 2.46
```
Pro samotné devops - návod je na adrese https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt

```bash
# dependencies
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release

# Download and install the Microsoft signing key:
sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
  gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

# Add the Azure CLI software repository: 
AZ_DIST=$(lsb_release -cs)
echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources


# install cli
sudo apt-get update
sudo apt-get install azure-cli

# install extensions: https://learn.microsoft.com/en-us/azure/devops/repos/git/share-your-code-in-git-cmdline?view=azure-devops
az extension add --name azure-devops
```

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
