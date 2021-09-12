# this file contains all package to install

{ pkgs, ... }:

{
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
        # app
        thunderbird

        # font
        (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
        
        # editor / ide

        # common line utility
        zip
        unzip
        pandoc
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
        #java (see below)
      ];

# programs
  programs = {
  # clone of "cat(1)"
  bat.enable = true;

  # A better way to navigate directories
  broot.enable = true;

  # a modern replacement for ls. (like l
  exa.enable = true;
  exa.enableAliases = true;

  # light image viewer
  feh.enable = true;

  # firefox browser
  firefox.enable = true;

  # git
  # (see config in "git.nix")
  git.enable = true;

  # htop system monitor
  htop.enable = true;

  # i3status
  # (see config in "i3.nix")
  #i3status.enable = true;

  # java
  java.enable = true;

  # mathplotlib (python library)
  matplotlib.enable = true;

  # mcfly eplaces your default ctrl-r shell history search with an intelligent
  # (see config in "zsh.nix")
  mcfly.enable = true;

  # opam ocaml package manager
  opam.enable = true;

  # urxvt-unicode terminal emulator.
  # (see config in "xresources.nix")
  urxvt.enable = true;

  # vim editor (see config in vim.nix)
  vim.enable = true;

  # zsh shell (see config in zsh.nix)
  zsh.enable = true;
  };
}
