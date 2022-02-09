{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
  programs.neovim = {
    vimAlias = false;
    vimdiffAlias = true;
    package = pkgs.neovim-nightly;
    plugins = with pkgs.vimPlugins; [
      # Base
      #popup-nvim
      #plenary-nvim
      #nvim-treesitter
      #telescope-nvim
      #vim-fugitive
      #vim-markdown
      #vim-trailing-whitespace
      #vim-surround
      #vim-which-key

      # LSP
      #cmp-buffer
      #cmp-nvim-lsp
      #nvim-cmp
      #nvim-compe
      #nvim-lspconfig

      # Tabs
      #barbar-nvim

      # Status Line
      #lualine-nvim

      #language
      vim-nix

      #theming
      ayu-vim
      vim-airline
    ];
    extraConfig = ''
      set number
      lua << EOF
        ${builtins.readFile ../nvim/settings.lua}
        ${builtins.readFile ../nvim/map.lua}
      EOF
    '';
  };
}

