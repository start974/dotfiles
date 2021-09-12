# this file contains all package to install

{ pkgs, ... }:

{
    home.packages = with pkgs; [
        # app
        thunderbird

        # editor / ide

        # common line utility
        zip
        unzip
        pandoc
        tree
        htop
        tig
        ncdu

        # image
        scrot

        # document
        evince
        libreoffice

        # video
        vlc

        # language
        perl
        python3
        coq
    ];
}
