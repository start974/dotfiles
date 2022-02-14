{
  name_pc,
  i3bar_name ? "bottom"
}:
{ pkgs, lib, config, ... }:
let
  i3lock_cmd = "${../i3}/lock.sh";
  wallpaper = "${../i3/wallpaper/wallpaper1.jpg}";
  i3bar_file = "~/.config/i3status-rust/config-${i3bar_name}.toml";
  mod = "Mod4";
  amixer = "${pkgs.alsaUtils}/sbin/amixer";
  i3_status_nix = ./. + "/i3_status/i3_status-${name_pc}.nix";
  web_workspace = "1: web";
  chat_workspace = "5: chat";
  music_workspace = "6: music";
  exec_cmd = "exec --no-startup-id";
  mode_default_str = "mode default";
in
{
  imports = [
    (import i3_status_nix { inherit i3bar_name; })
  ];

  # rofi
  programs.rofi = {
    location = "top";
    theme = "glue_pro_blue";
    pass.enable = false;
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
      rofi-power-menu
    ];
  };

  # set screen locker to i3 lock
  services.screen-locker = {
    enable = true;
    inactiveInterval = 3;
    lockCmd = "${i3lock_cmd}";
    xautolock = {
      enable = true;
      detectSleep = true;
      package = pkgs.xautolock;
    };
  };

  # X session
  xsession = {
    #numlock.enable = enable;
    profileExtra = ''
      eval $(${pkgs.gnome3.gnome-keyring}/bin/gnome-keyring-daemon --daemonize --components=ssh,secrets)
      export SSH_AUTH_SOCK
    '';
    # i3 gestion
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;

      config = {
        modifier = mod;
        terminal = "kitty";
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
        # workspaces
        "${mod}+1"              = "workspace ${web_workspace}";
        "${mod}+Shift+1"        = "move container to workspace ${web_workspace}";

        "${mod}+5"              = "workspace ${chat_workspace}";
        "${mod}+Shift+5"        = "move container to workspace ${chat_workspace}";

        "${mod}+6"              = "workspace ${music_workspace}";
        "${mod}+Shift+6"        = "move container to workspace ${music_workspace}";

        # lock
        "Control+${mod}+l"      = "exec ${i3lock_cmd}";
        "XF86Lock"              = "exec ${i3lock_cmd}";
        "${mod}+Shift+e"        = "exec \"rofi -show p " +
        "-modi p:rofi-power-menu -lines 6 -location 1 -width 20\"";

        # browse file
        "${mod}+e"              = "exec ${pkgs.cinnamon.nemo}/bin/nemo";

        # firefox
        "${mod}+b"              = "exec ${pkgs.firefox}/bin/firefox";
        "XF86HomePage"          = "exec ${pkgs.firefox}/bin/firefox";

        # d-menu
        "${mod}+d"              = "${exec_cmd} \"rofi -modi window,drun,run,calc,emoji " +
        "-show run -sidebar-mode -show-icons -lines 7\"";
        "${mod}+n"              = "exec ${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";

        #sound
        "XF86AudioRaiseVolume"  = "exec ${amixer} -q sset Master 5%+ unmute";
        "XF86AudioLowerVolume"  = "exec ${amixer} -q sset Master 5%- unmute";
        "XF86AudioMute"         = "exec ${amixer} -q sset Master toggle";

        # light
        "XF86MonBrightnessUp"   = "exec light -A 5%";
        "XF86MonBrightnessDown" = "exec light -U 5%";

        # multimedia
        "XF86AudioPlay"         = "exec playerctl play-pause";
        "XF86AudioPause"        = "exec playerctl play-pause";
        "XF86AudioNext"         = "exec playerctl next";
        "XF86AudioPrev"         = "exec playerctl previous";

      };

      bars = [{
        fonts = {
          names = [ "DejaVu Sans Mono" "FontAwesome5Free" ];
          size = 10.0;
        };
        colors = {
          separator = "#666666";
          background = "#223344";
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
      }];

      window.commands = [
        {
          command = "floating enable";
          criteria = { class = "Nemo"; };
        }
      ];

      assigns = {
        ${web_workspace}    = [{ class = "Firefox"; instance="Navigator"; }];
        ${chat_workspace}   = [{ class = "discord";}
        { class = "Mailspring"; } ];
        ${music_workspace}  = [{ class = "Spotify"; }];
      };

      startup = [
        { command = "firefox"; notification = false; }
        { command = "dropbox"; }
        { command = "feh --bg-fill ${wallpaper}"; }
      ];
    };
  };
};
        }
