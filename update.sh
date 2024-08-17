#!/bin/sh

rm -rf ~/.config/sway/config &&
sudo nixos-rebuild switch --flake .
