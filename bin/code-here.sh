#!/usr/bin/env bash
# doc: spustí VS Code a nahodí proxy, pokud jsem na vpn

is_on_vpn=$(nmcli connection show --active | grep extvpn.o2.cz)
[[ ! -z "$is_on_vpn" ]] && source ~/bin/set-proxy-on
code .
