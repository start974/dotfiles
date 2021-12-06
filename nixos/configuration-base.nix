{
  hostName
  , user ? { name = "jdam"; description = "jérémy"; }
}:
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs,... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      version = 2;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking = {
    inherit hostName;
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";


  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    displayManager = {
      defaultSession = "none+i3";
    };

    # layout
    layout = "us(intl)";

    # Enable the i3 Desktop Environment.
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        libnotify
        rxvt_unicode
        dmenu       # application launcher most people use
        i3status    # gives you the default i3 status bar
        i3lock      # default i3 screen locker
      ];
    };
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = with pkgs; [ epson-escpr ];
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${user.name}" = {
    isNormalUser = true;
    description = user.description;
    extraGroups = [ "wheel" "networkmannager" "audio" "video"];
  };

  # zsh default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # allow unfree
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    git
    networkmanager
    wget
    firefox
  ];
  # all package in this config add in home-manager

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:
  services.journald.extraConfig = ''
        SystemMaxUse=1G
  '';

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # auto upgrade
  system.autoUpgrade = {
    enable = true;
    channel = https://nixos.org/channels/nixos-21.05;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

