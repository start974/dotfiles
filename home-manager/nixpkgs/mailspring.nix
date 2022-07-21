{ pkgs, ... }:
let
  version = "1.10.3";
  url = "https://github.com/Foundry376/Mailspring/releases/download/${version}/" +
  "mailspring-${version}-amd64.deb";

  sha256 = "sha256:1g7xn41d1jjjbyg0r5vqjqv6csidgkkcz5bfa3g9n0j1liwqlzgq";
in
  {
    home.packages = with pkgs; [
      mailspring
      libsecret
      gnome.gnome-keyring
    ];

    nixpkgs.overlays = [
      (self: super: {
        mailspring = super.mailspring.overrideAttrs (_: {
          inherit version;
          src = builtins.fetchurl { inherit url sha256; };
        });
      })
    ];
  }

