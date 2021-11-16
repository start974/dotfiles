#!/bin/sh -xe

CUR_DIR=$(realpath $(dirname $0))
NAME="$1"

sudo ln -sf ${CUR_DIR}/configuration-${NAME}.nix /etc/nixos/configuration.nix

sudo nixos-rebuild switch
