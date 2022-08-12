{ pkgs, ... }:
{
  nixpkgs.overlays =
  let
    url = "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz";
    src = builtins.fetchTarball {inherit url; };
    moz_pkgs = (import "${src}/firefox-overlay.nix");
  in [ moz_pkgs ];

  home.packages = with pkgs; [
    latest.firefox-nightly-bin
  ];
}

