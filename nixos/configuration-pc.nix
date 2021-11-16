{ config, lib, pkgs, modulesPath,... }:
{
  # hardware
  imports = [
    (import ./configuration-base.nix { hostName = "nixos-pc"; })
    (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/0394af1e-6177-4943-899b-4f86f073feeb";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/nvme0n1p1";
    fsType = "vfat";
  };

  swapDevices = [ ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  
  # auto login
  services.xserver.displayManager.autoLogin = {
    enable = true;
    user = "jdam";
  };

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.interfaces = {
    enp1s0.useDHCP = true;
    wlp2s0.useDHCP = true;
  };
}

