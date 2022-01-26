{ config, pkgs, modulesPath, powerManager, lib,... }:

{
  imports =
    [ # Include the results of the hardware scan.
    <nixos-hardware/dell/xps/13-9310>
    (import ./configuration-base.nix { hostName = "nixos-xps13"; })
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # hardware
  boot = {
    initrd.availableKernelModules = [ 
      "xhci_pci"
      "thunderbolt"
      "vmd"
      "nvme"
      "usb_storage"
      "sd_mod"
      "rtsx_pci_sdmmc" 
    ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/34b0fe33-b577-4ecc-beb6-a1c69411e38f";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6C2A-C265";
    fsType = "vfat";
  };

  fileSystems."/drive/data" = {
    device = "/dev/disk/by-label/DATA";
    fsType = "exfat";
    options = [ "uid=1000" "gid=100" "dmask=007" "fmask=117" ];
  };

  swapDevices = [ ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  # network
  networking.interfaces.wlp0s20f3.useDHCP = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # lights setings
  programs.light.enable = true;

  #bluetooth
  hardware.bluetooth.enable = true;

  #finger print
  #services.fprintd = {
  #  enable = true;
  #  package = pkgs.libfprint-2-tod1-goodix;
  #};
}

