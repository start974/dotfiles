{
  i3bar_name,
  name_pc,
}:
let
  i3_block_nix = ./. + "/${name_pc}.nix";
in
{ pkgs, ... }:
{
  programs.i3status-rust.bars."${i3bar_name}" = {
    blocks = import i3_block_nix;
    icons = "awesome5";
    theme = "semi-native";
  };
}
