#!/usr/bin/env bash

background=$(find $HOME/Pictures/wp -type f | shuf -n 1)
swaybg --image $background -m fill&

function handle {
    if [[ ${1:0:9} == "workspace" ]]; then
        echo $line
    newbackground=$(find $HOME/Pictures/wp -type f | shuf -n 1)
    echo $newbackground
    until [[ ("${background}" != "${newbackground}") && (-r $newbackground) ]]; do
        newbackground=$(find $HOME/Pictures/wp -type f | shuf -n 1)
        echo $newbackground
        sleep .3
        done
    echo $newbackground
    background=newbackground
    swpid=`ps axf | grep swaybg | grep -v grep | awk '{printf $1}'`
    swaybg --image $newbackground -m fill&
    sleep .3
    kill $swpid
    fi
}

socat - UNIX-CONNECT:/tmp/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock | while read line; do handle $line; done
