{ config, lib, pkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = rec {
    username = "jdam";
    homeDirectory = "/home/${username}";

    sessionVariables = {
      EDITOR = "vim";
    };
  };
  # import all other modules
  imports = [
    ./package.nix

    ./git.nix
    ./powerline.nix
    ./vim.nix
    ./vscode.nix
    ./xresources.nix
    ./zsh.nix
  ];

  # enable manual in html
  manual.html.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
  home.enableNixpkgsReleaseCheck = false;
}
