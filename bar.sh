#!/bin/bash

i3status | (read line && echo "$line" && read line && echo "$line" && read line && echo "$line" && while :
do
	read line
	vpn_status=$(piactl get connectionstate)
	if [[ $vpn_status == *"Connected"* ]]; then
		echo ",[{\"full_text\":\"VPN: $vpn_status\",\"color\":\"#00FF00\" },${line#,\[}" || exit 1
	else	
		echo ",[{\"full_text\":\"VPN: $vpn_status\" },${line#,\[}" || exit 1
	fi
done)
