#!/bin/sh -xe

sudo ln -sf $(pwd) /etc/nixos/
sudo nixos-rebuild switch
