{
  name_pc,
  i3bar_name ? "bottom"
}:
{ pkgs, lib, config, ... }:
let
  wallpaper = "${../i3/wallpaper/wallpaper1.jpg}";
  i3bar_file = "~/.config/i3status-rust/config-${i3bar_name}.toml";
  mod = "Mod4";
  exec_cmd = "exec --no-startup-id";
  mode_default_str = "mode default";
  terminal = "kitty";
  workspace = {
    web = "1: web";
    chat = "5: chat";
    music = "6: music";
  };
  bin = {
    amixer = "${pkgs.alsaUtils}/sbin/amixer";
    betterlockscreen = "${pkgs.betterlockscreen}/bin/betterlockscreen";
    firefox = "${pkgs.firefox}/bin/firefox";
    flameshot = "${pkgs.flameshot}/bin/flameshot";
    nm_dmenu ="${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";
    thunar = "${pkgs.xfce.thunar}/bin/thunar";
  };
  i3lock_cmd = "${bin.betterlockscreen} -l";
in
  {
    imports = [
      (import ./i3_status { inherit i3bar_name name_pc; })
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

  # config screen locker
  services.betterlockscreen = {
    enable = true;
    inactiveInterval = 20;
  };

  # i3 gestion
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = {
      modifier = mod;
      inherit terminal;
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
        "${mod}+1"              = "workspace ${workspace.web}";
        "${mod}+Shift+1"        = "move container to workspace ${workspace.web}";

        "${mod}+5"              = "workspace ${workspace.chat}";
        "${mod}+Shift+5"        = "move container to workspace ${workspace.chat}";

        "${mod}+6"              = "workspace ${workspace.music}";
        "${mod}+Shift+6"        = "move container to workspace ${workspace.music}";

        # lock
        "${mod}+Shift+x"        = "exec ${i3lock_cmd}";
        "XF86Lock"              = "exec ${i3lock_cmd}";
        "${mod}+Shift+e"        = "exec \"rofi -show p " +
        "-modi p:rofi-power-menu -lines 6 -location 1 -width 20\"";

        # browse file
        "${mod}+x"              = "exec ${bin.thunar}";

        # screen shot
        "${mod}+c"              = "exec ${bin.flameshot} gui";

        # firefox
        "${mod}+b"              = "exec ${bin.firefox}";
        "XF86HomePage"          = "exec ${bin.firefox}";

        # d-menu
        "${mod}+d"              = "${exec_cmd} \"rofi -modi window,drun,run,calc,emoji " +
        "-show run -sidebar-mode -show-icons -lines 7\"";
        "${mod}+n"              = "exec ${bin.nm_dmenu}";

        #sound
        "XF86AudioRaiseVolume"  = "exec ${bin.amixer} -q sset Master 5%+ unmute";
        "XF86AudioLowerVolume"  = "exec ${bin.amixer} -q sset Master 5%- unmute";
        "XF86AudioMute"         = "exec ${bin.amixer} -q sset Master toggle";

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
          criteria = { class = "Thunar"; };
        }
      ];

      assigns = {
        ${workspace.web}    = [{ class = "firefox"; instance="Navigator"; }];
        ${workspace.chat}   = [{ class = "discord"; }
                               { class = "Mailspring"; } 
                               { class = "Mattermost"; } 
                              ];
        ${workspace.music}  = [{ class = "Spotify"; }];
      };

      startup = [
        { command = "firefox"; notification = false; }
        { command = "dropbox"; }
        { command = "gnome-keyring-daemon --daemonize"; }
        { command = "feh --bg-fill ${wallpaper}"; }
      ];
    };
  };
}
