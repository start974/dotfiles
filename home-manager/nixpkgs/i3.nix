{
  name_pc,
  i3bar_name ? "bottom"
}:
{ pkgs, lib, config, ... }:
let
  i3lock_cmd = "${../i3}/lock.sh";
  i3bar_file = "~/.config/i3status-rust/config-${i3bar_name}.toml";
  mod = "Mod4";
  amixer = "${pkgs.alsaUtils}/sbin/amixer";
  i3_status_nix = ./. + "/i3_status/i3_status-${name_pc}.nix";
in
  {
    imports = [
      (import i3_status_nix { inherit i3bar_name; })
    ];
  
  # set screen locker to i3 lock
  services.screen-locker = {
    enable = true;
    inactiveInterval = 3;
    lockCmd = i3lock_cmd;
    xautolock = {
      enable = true;
      detectSleep = true;
      package = pkgs.xautolock;
    };
  };

  # i3 gestion
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = mod;
      defaultWorkspace = "workspace number 2";
      fonts = {
        names = [ "DejaVu Sans Mono" "FontAwesome5Free" ];
        size = 13.0;
      };
      gaps = {
        smartGaps = true;
        smartBorders = "on";
        inner = 5;
      };
      keybindings = lib.mkOptionDefault {
        # lock
        "Control+${mod}+l" = "exec ${i3lock_cmd}";
        # firefox
        "${mod}+b" = "exec ${pkgs.firefox}/bin/firefox";
        #sound
        "XF86AudioRaiseVolume" = "exec ${amixer} -q sset Master 5%+ unmute";
        "XF86AudioLowerVolume" = "exec ${amixer} -q sset Master 5%- unmute";
        "XF86AudioMute"        = "exec ${amixer} -q sset Master toggle";

      };
      bars = [
        {
          fonts = {
            names = [ "DejaVu Sans Mono" "FontAwesome5Free" ];
            size = 10.0;
          };
          colors = {
            separator = "#666666";
            background = "#1111122";
            statusline = "#dddddd";
            focusedWorkspace = {
              background = "#0088CC"; 
              border = "#0088CC";
              text = "#ffffff";
            };
            activeWorkspace = {
              background = "#333333"; 
              border ="#333333";
              text = "#ffffff";
            };
            inactiveWorkspace = {
              background = "#333333"; 
              border = "#333333";
              text = "#888888";
            };
            urgentWorkspace = {
              background = "#2f343a";
              border = "#900000";
              text = "#ffffff";
            };
          };
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${i3bar_file}";
          position = "bottom";
        }
      ];
      assigns = {
        "1: web" = [{ class = "^Firefox$"; }];
      };
    };
    extraConfig = 
    ''
      exec --no-startup-id ${pkgs.firefox}/bin/firefox
    '';
  };
}
