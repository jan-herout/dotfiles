#!/usr/bin/env bash
# doc: spustí VS Code a nahodí proxy, pokud jsem na vpn

# is_on_vpn=$(nmcli connection show --active | grep extvpn.o2.cz)
# [[ ! -z "$is_on_vpn" ]] && source ~/bin/set-proxy-on

# pokud nemáš žádné parametry, spouštíš se v aktuálním adresáři

source $HOME/bin/set-proxy

if [[ -d "./src" ]]; then
  export PYTHONPATH="src;$PYTHONPATH"
fi

if [[ "$#" -gt 0 ]]; then
  code --password-store="gnome-libsecret" "$@"
else
  code --password-store="gnome-libsecret" .
fi
wmctrl -xa "code"
