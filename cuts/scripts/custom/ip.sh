#!/bin/bash

wlanConnected=$(nmcli dev status | grep -vE "ethernet|loopback|wifi-p2p" | grep wifi | grep -w 'conectado\|connected')
existWifi=$(echo $wlanConnected | wc -c )


if [ $existWifi -ge 7  ]; then

    wlanIface=$(echo $wlanConnected | awk '{print $1}')
    wlanIp=$(ifconfig $wlanIface| head -n 2 | tail -n 1 | awk '{print $2}'  )

   echo -e "%{F#FFFF} \ufaa8 $wlanIp %{u-}"
else 
    ip addr | grep -C 2 link/ether | grep 'state UP' &>/dev/null
    if [[ $? -eq 0 ]]; then
        ethConnected=$(ip addr | grep -A 1 link/ether | grep inet | tr '/' ' ' | awk '{print $2}')
        echo -e "%{F#FFFF} \uf6ff %{F#24EE00}$ethConnected %{u-} "
    else
        echo "%{F#FF0000}$( echo -e "\uf6a6 No networks" )%{u-}"
    fi
fi