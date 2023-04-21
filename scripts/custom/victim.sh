#!/bin/bash

target=$(cat /home/seba/.config/polybar/scripts/custom/target.txt)

if [ ${#target} -ge 9 ]; then

    echo "%{F#FF0000} $(echo -e "\uf9fd")%{F#05ff26} $(echo -e "$target") %{u-}"
else
    echo "%{F#FF0000}$(echo -e "\uf9fd No target")%{u-}"
fi