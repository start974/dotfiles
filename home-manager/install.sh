#!/bin/sh -xe

ln -sf $(pwd) ~/.config

# install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

home-manager switch
