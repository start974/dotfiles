# this file contains all package to install

{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # boot
    refind

    # app
    networkmanager_dmenu
    thunderbird
    arandr

    # font
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    font-awesome

    # unfree
    discord
    betterdiscordctl
    spotify

    # ide
    jetbrains.clion
    jetbrains.idea-ultimate

    # common line utility
    zip
    unzip
    pandoc
    tig
    ncdu
    taskwarrior-tui
    trash-cli

    # image
    scrot

    # document
    evince
    libreoffice

    # video
    vlc

    # language & tool
    perl
    python3
    conda
    coq
    gnumake
    # java (see below)
  ];
  services = {
  };
 
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
    i3status-rust.enable = true;

    # java
    java.enable = true;

    # mathplotlib (python library)
    matplotlib.enable = true;

    # mcfly eplaces your default ctrl-r shell history search with an intelligent
    # (see config in "zsh.nix")
    mcfly.enable = true;

    # opam ocaml package manager
    opam.enable = true;

    # powerline-go 
    powerline-go.enable = true;

    # ssh client
    ssh.enable = true;

    # task Warrior (todo list)
    taskwarrior.enable = true;

    #texLive
    texlive.enable = true;

    # topgrade (upgrader)
    topgrade.enable = true;

    # tmux
    tmux.enable = true;

    # urxvt-unicode terminal emulator.
    # (see config in "xresources.nix")
    urxvt.enable = true;

    # vim editor (see config in vim.nix)
    vim.enable = true;

    # vs code (see config in vscode.nix)
    vscode.enable = true;

    # zsh shell (see config in zsh.nix)
    zsh.enable = true;
  };

}
