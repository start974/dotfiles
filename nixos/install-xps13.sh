#!/bin/sh -xe

sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
sudo nix-channel --update

sudo ln -sf $(pwd)/configuration-xps13.nix /etc/nixos/configuration.nix

sudo nixos-rebuild switch
