{ pkgs, config, ... }:
#TODO add image to lock
let i3lock = ":${pkgs.i3lock}/bin/i3lock -n -c 000000";
i3bar_name = "bottom" ;
i3bar_file = "${config.home.homeDirectory}/.config/i3status-rust/config-${i3bar_name}.toml"; in
{
  # set screen locker to i3 lock
  services.screen-locker = {
    enable = true;
    inactiveInterval = 5;
    lockCmd = i3lock;
  };

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      assigns = {
        "1: web" = [{ class = "firefox"; }];
      };
      modifier = "Mod4";
      #gaps = {
      #  smartGaps = true;
      #};
      bars = [
        {
          fonts = {
            names = [ "DejaVu Sans Mono" "FontAwesome5Free" ];
            size = 11.0;
          };
          colors = {
            separator = "#666666";
            background = "#111111";
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
          statusCommand = "i3status-rs ${i3bar_file}";
          position = "bottom";
        }
      ];
    };
  };

  # i3 status bar
  programs.i3status-rust = {
    bars."${i3bar_name}" = {
      blocks = [
        {
          block = "disk_space";
          path = "/";
          alias = "sys";
          info_type = "used";
          format = "{icon} {alias}: {used}/{total} ({available} free)";
          unit = "GB";
          interval = 60;
          warning = 40.0;
          alert = 20.0;
        }
        {
          block = "cpu";
          interval = 1;
          format = "{barchart}{utilization} {frequency}";
        }
        {
          block = "load";
          interval = 2;
          format = "{1m}";
        }
        {
          block = "memory";
          display_type = "memory";
          format_mem = "{mem_used}/{mem_total}({mem_used_percents})";
          icons = true;
          clickable = false;
          interval = 5;
          warning_mem = 70;
          critical_mem = 90;
        }
        {
          block = "net";
          format = "{ssid} {signal_strength} {speed_up;K*b} {speed_down;K*b}";
          interval = 5;
        }
        {
          block = "backlight";
          device = "intel_backlight";
          step_width = 5;
        }
        { 
          block = "sound";
          step_width = 5;
        }
        {
          block = "music";
          player = "spotify";
          hide_when_empty = true;
          buttons = ["play" "next"];
        }
        {
          block = "battery";
          interval = 5;
          format = "{percentage} {time}";
          missing_format = "-";
        }
        {
          block = "time";
          interval = 5;
          format = "%a %D %T";
        }
      ];
      icons = "awesome5";
      theme = "modern";
    };
  };
}
