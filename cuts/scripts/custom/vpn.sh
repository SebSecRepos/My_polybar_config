#!/bin/bash

/usr/sbin/ifconfig | grep tun0  &>/dev/null

if [ $? -eq 0 ]; then

    echo "%{F#fffff}\uf6a6 $( /usr/sbin/ifconfig | grep -C 1 tun0 | tail -n 1 | awk '{print $2}'  )%{u-}"
else
    echo "%{F#FF0000}$( echo -e "\uf6a6 Disconnected" )%{u-}"
fi