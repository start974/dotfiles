{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  home.packages = with pkgs; [
    neovim-nightly
    clang-tools
    sumneko-lua-language-server
    tree-sitter
    gcc
  ];

  home.sessionVariables.EDITOR = "${pkgs.neovim-nightly}";

  xdg.configFile.nvim ={
    source = ../nvim;
    recursive= true;
  };
}

