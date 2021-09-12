{ pkgs, ... }:
{
    xresources.properties = {
    # Ressources
      "*locale" = true;
      "*metaSendsEscape" = true;

    # colors
      "*.foreground"  = "#b0a5e3";
      "*.background"  = "#292929";
      "*.cursorColor" = "#7a5Eae";

      # Black / grey
      "*.color0"      = "#000000";
      "*.color8"      = "#3f3f3f";

      # Red
      "*.color1"      = "#f15252";
      "*.color9"      = "#F50606";

      # Green
      "*.color2"      = "#5ddc7b";
      "*.color10"     = "#09B540";

      # Yellow
      "*.color3"      = "#e6e871";
      "*.color11"     = "#f1ef06";

      # Blue
      "*.color4"      = "#157ef1";
      "*.color12"     = "#0a54a4";

      # Magenta
      "*.color5"      = "#9c37da";
      "*.color13"     = "#640c9b";

      # Cyan
      "*.color6"      = "#0fceba";
      "*.color14"     = "#068973";

      # white
      "*.color7"      = "#e8e8e8";
      "*.color15"     = "#ffffff";
    };

    programs.urxvt = {
      enable = true;
      fonts = [ "xft:MesloLGS NF:size=15" ];
      transparent = true;
      shading = 50;
      keybindings = {
        "Shift-Control-C" = "perl:clipboard:copy";
        "Shift-Control-V" = "perl:clipboard:paste";
      };
      extraConfig = {
        "perl-ext-common" = "default,matcher,clipboard,resize-font";

        # using perl-ext-common: "default, matcher"
        "url-launcher" = "firefox";
        "underlineURLs" = true;
        "urlButton" = 1; # left click

      };
    };
}
