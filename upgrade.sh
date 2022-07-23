#!/bin/sh -e

CUR_DIR=$(realpath $(dirname $0))
VERSION="$1"

echo_color () {
    COLOR='\033[0;33m'
    NC='\033[0m' # No Color
    echo -e "${COLOR}$1${NC}"
}
update_line () {
    KEY="$1"
    FILE="${CUR_DIR}/$2"

    VERSION_MATCH="${KEY}\\.stateVersion = \"[0-9]+\.[0-9]+\";"
    VERSION_NEW="${KEY}.stateVersion = \"{version}\";"

    sed -i "s/${VERSION_MATCH}/${VERSION_NEW}/g" $FILE
}

# update channels
echo_color "update channels to version: ${VERSION}"
CHANEL_NIXOS="https://nixos.org/channels/nixos-${VERSION}"
CHANEL_HOME_MANAGER="https://github.com/nix-community/home-manager/archive/release-${VERSION}.tar.gz"
nix-channel --add $CHANEL_HOME_MANAGER home-manager
nix-channel --add $CHANEL_NIXOS nixos
nix-channel --update

sudo nix-channel --add $CHANEL_NIXOS nixos
sudo nix-channel --update

# update version in nixos file
echo_color "change version in configuration files"
update_line "system" "nixos/configuration-base.nix"
update_line "home" "home-manager/nixpkgs/home-common.nix"

# update system and home-manager
echo_color "rebuild system"
sudo nixos-rebuild switch --upgrade boot

echo_color "rebuild home-manager"
home-manager switch
