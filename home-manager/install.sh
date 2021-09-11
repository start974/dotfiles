#!/bin/sh -xe

mkdir -p ~/.config
ln -sf $(pwd) ~/.config

# install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

home-manager switch
