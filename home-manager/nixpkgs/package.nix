# this file contains all package to install

{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # app
    arandr
    barrier
    networkmanager_dmenu
    playerctl
    rofi-power-menu
    xfce.thunar

    # font
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    font-awesome

    # unfree
    discord
    dropbox
    zoom-us
    spotify

    # ide
    jetbrains.clion
    jetbrains.pycharm-community
    jetbrains.idea-ultimate

    # common line utility
    ncdu
    pandoc
    taskwarrior-tui
    tig
    trash-cli
    unzip
    zip

    # image / video
    imagemagick
    flameshot
    scrot
    vlc

    # document
    evince
    libreoffice

    # mail
    mailspring
    libsecret
    gnome.gnome-keyring

    # language & tool
    coq
    perl
    #python3
    #autoconf
    #gnumake
    #gcc
    # java (see below)
    #(see below opam)
    # library
  ];

  #overlays
  nixpkgs.overlays = [(self: super: {
      discord = super.discord.overrideAttrs (_ :{ 
        src = builtins.fetchTarball 
          https://discord.com/api/download?platform=linux&format=tar.gz;
      });
    }
  )];

  # programs
  programs = {
    # alcritty a terminal
    # (see config in "alacritty.nix")
    # alacritty.enable = true;

    # autorandr
    autorandr.enable = true;

    # clone of "cat(1)"
    bat.enable = true;

    # A better way to navigate directories
    broot.enable = true;

    # direnv
    direnv.enable = true;

    # light image viewer
    feh.enable = true;

    # firefox browser
    firefox.enable = true;

    # git
    # (see config in "git.nix")
    git.enable = true;

    # htop system monitor
    #htop.enable = true;
    bottom.enable = true;

    # i3status
    # (see config in "i3.nix")
    i3status-rust.enable = true;

    # java
    java.enable = true;
    java.package = pkgs.jdk;

    # kitty termial
    # (see config in "kitty.nix")
    kitty.enable = true;

    # a modern replacement for ls.
    lsd.enable = true;
    lsd.enableAliases = true;

    # mathplotlib (python library)
    # matplotlib.enable = true;

    # man (manual linux)
    man.enable = true;

    # mcfly eplaces your default ctrl-r shell history search with an intelligent
    # (see config in "zsh.nix")
    mcfly.enable = true;

    # opam ocaml package manager
    # opam.enable = true;

    # powerline-go 
    powerline-go.enable = true;

    # rofi (dmenu alternative)
    # (see config in "i3.nix")
    rofi.enable = true;

    # ssh client
    ssh = {
      enable = true;
      forwardAgent = true;
      controlPersist = "1h";
    };

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
    # urxvt.enable = true;

    # vim editor
    # (see config in vim.nix)
    vim.enable = true;
    #neovim.enable = true;

    # vs code
    # (see config in vscode.nix)
    vscode.enable = true;

    # zsh shell 
    # (see config in zsh.nix)
    zsh.enable = true;

  };

}
