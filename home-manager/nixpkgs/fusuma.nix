{pkgs, ...}:
{
    # muti-touch reconizer https://github.com/iberianpig/fusuma
    services.fusuma = {
      enable = true;
      package = pkgs.fusuma;
      extraPackages = with pkgs; [ 
        coreutils
        xdotool];
      settings = {

        swipe = {
          "3" = {
            left.command = "exec i3 workspace next";
            right.command = "exec i3 workspace prev";
            up.command = "exec i3 fullscreen toggle";
            down.command = "exec i3 floating toggle";
          };
        };

        pinch = {
          "in".command = "\"xdotool key ctrl+plus\"";
          "out".command = "\"xdotool key ctrl+minus\"";
        };

        threshold = {
          swipe = 0.4;
          pinch = 0.4;
        };

        interval = {
          swipe = 0.8;
          pinch = 0.1;
        };
      };
    };
  }
