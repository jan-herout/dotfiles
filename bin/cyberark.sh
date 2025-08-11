#!/bin/bash
username=$(grep username "$1" | tr -d "
" | awk 'BEGIN {FS=":"}{print $3}')

address=$(grep address "$1" | tr -d "
" | awk 'BEGIN {FS=":"}{print $3}')

port=$(grep "server port" "$1" | tr -d "
" | awk 'BEGIN {FS=":"}{print $3}')

width=$(grep desktopwidth "$1" | tr -d "
" | awk 'BEGIN {FS=":"}{print $3}')

height=$(grep desktopheight "$1" | tr -d "
" | awk 'BEGIN {FS=":"}{print $3}')

local_username=$(grep username "$1" | tr -d "
" | awk 'BEGIN {FS=":"}{print $3}')

echo "username=$username"
echo "address=$address"
echo "port=$port"
echo "width=$width"
echo "height=$height"

echo flatpak run com.freerdp.FreeRDP /v:$address /p:$port  /shell:"PSM@3b713e7d-3057-44fb-851d-d8672080354a"

# echo "rdp=xfreerdp /v:$address /p:$port /w:$width /h:$height /u:$username /cert-ignore /sec:tls"
#rdp=`xfreerdp /v:$address /p:$port /w:$width /h:$height /u:$username /cert-ignore /sec:tls`