#!/bin/sh -xe
CUR_DIR=$(realpath $(dirname $0))
NAME="$1"

CONFIG_DIR="${HOME}/.config"
CONFIG_NIXPKGS="${CONFIG_DIR}/nixpkgs"
CUR_NIXPKGS="${CUR_DIR}/nixpkgs"

mkdir -p ${CONFIG_DIR}
ln -sf ${CUR_NIXPKGS} ${CONFIG_NIXPKGS}
ln -sf "${CUR_NIXPKGS}/home-${NAME}.nix" "${CONFIG_NIXPKGS}/home.nix"

# install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

home-manager switch
