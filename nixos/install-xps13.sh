#!/bin/sh -xe

sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
sudo nix-channel --update

source $(dirname $0)/install-common.sh "xps13"
