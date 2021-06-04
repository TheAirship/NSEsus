#!/bin/bash

declare -A scanTypes

scanTypes=( ["80"]="http.*vuln" ["25"]="smtp.*vuln" ["139,445"]="smb.*vuln" )

# Check if at least one arg was passed

if [ $# -eq 0 ]; then
    echo "Please provide at least one Nmap-compatible IP address or address range"
    exit
fi

# Check if an alternative location for Nmap scripts was provided

if [ -z "$2" ]; then
    nmapDir="/usr/share/nmap/scripts"
else
    nmapDir=$2
fi

# Run the rest

for sType in "${!scanTypes[@]}"; do
    foundServers=$(nmap -sS -v -p $sType $1 2>/dev/null | grep 'Host is up' -B1 | grep -v Host | cut -d" " -f5)
    fRegex='OS: (.*) \| (OS | Com)'
    echo "Scanning for port $sType"
    #echo "Found the following servers: $foundServers"
	for server in $foundServers; do
		if [ $server != "--" ]; then
			echo "-----SCANNING $server-----"
			for vScript in $(ls $nmapDir | grep "${scanTypes[$sType]}"); do
				if [ "$(nmap -v -p $sType $server --script $vScript | grep "VULNERABLE:")" ]; then
					echo "Vulnerable to $vScript? SURE IS!"
				#else
					#echo "Vulnerable to $vScript? Nope."
				fi
			done
		fi
	done

done
