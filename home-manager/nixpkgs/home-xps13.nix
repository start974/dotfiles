{ ... }:
{
  imports = [
    ./home-common.nix
    (import ./i3.nix { 
      name_pc = "xps13";
    })
  ];
}
