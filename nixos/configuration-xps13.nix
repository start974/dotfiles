# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, modulesPath,powerManager,lib,... }:

{
  imports =
    [ # Include the results of the hardware scan.
    (import ./configuration-base.nix { hostName = "nixos-xps-13"; })
    <nixos-hardware/dell/xps/13-9310>
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  # hardware

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/34b0fe33-b577-4ecc-beb6-a1c69411e38f";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/6C2A-C265";
      fsType = "vfat";
    };

  swapDevices = [ ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  # network
  networking = {
    networkmanager.enable = true;
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.wlp0s20f3.useDHCP = true;
};

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
}

