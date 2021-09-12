# this file contains all package to install

{ pkgs, ... }:

{
    home.packages = with pkgs; [
        # app
        thunderbird

        # terminal tools

        # editor / ide

        # common line utility
        zip
        unzip
        pandoc
        tree
        htop
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
