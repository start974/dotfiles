{ ... }:
{
  imports = [
    ./home-common.nix
    ./fusuma.nix
    (import ./i3.nix { 
      name_pc = "xps13";
    })
  ];
  # desactive picom
  services.picom.enable = false;
}
