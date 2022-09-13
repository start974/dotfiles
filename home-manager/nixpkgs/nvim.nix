{ pkgs, ... }:
let
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
  #neovim_pkgs = pkgs.neovim-nightly;
  neovim-pkgs = pkgs.neovim;
in
{


  home.packages = with pkgs; [
    neovim-pkgs
    tree-sitter
    # C language
    gcc
    #clang
    clang-tools

    lua
    sumneko-lua-language-server

    # ocaml
    ocamlPackages.ocp-indent
    ocamlPackages.merlin

    # bash
    nodePackages.bash-language-server
  ];

  home.sessionVariables.EDITOR = "${neovim-pkgs}/bin/nvim";

  # zsh aliases
  programs.zsh.shellAliases = {
    vi = "nvim";
    vim = "nvim";
    vimdiff = "nvim -d";
  };

  xdg.configFile.nvim ={
    source = ../nvim;
    recursive= true;
  };
}

