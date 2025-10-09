#!/usr/bin/env bash
# doc: Spouští xfreerdp s RDP souborem a po ukončení ho smaže

# get the first parameter
cyberark_rdp_file=$1
[ -z "$cyberark_rdp_file" ] && echo "Usage: $0 <rdp file.rdp>" && exit 1

# call xfreerdp with the provided rdp file
xfreerdp "$cyberark_rdp_file"

# remove the file after
notify-send "Removing: $cyberark_rdp_file" --icon=dialog-information
rm "$cyberark_rdp_file"