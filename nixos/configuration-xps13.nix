{ config, pkgs, modulesPath, powerManager, lib,... }:

{
  imports =
    [ # Include the results of the hardware scan.
    (import ./configuration-base.nix { hostName = "nixos-xps-13"; })
    <nixos-hardware/dell/xps/13-9310>
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

  # lights setings
  programs.light.enable = true;
  services.actkbd = {
    enable = true;
    bindings = [
      { keys = [ 225 ]; events = [ "key" ]; command =
        "/run/current-system/sw/bin/light -A 5"; }
      { keys = [ 224 ]; events = [ "key" ]; command =
        "/run/current-system/sw/bin/light -U 5"; }
    ];
  };

  # sound
  boot.extraModprobeConfig = ''
     options snd-intel-dspcfg dsp_driver=1
  '';

}

