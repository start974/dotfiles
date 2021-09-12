{ pkgs, ... }:
{
    xresources.properties = {
    # Ressources
        "*selectToClipboard" = true;
        "*locale" = true;
        "*metaSendsEscape" = true;

    # Font
        "URxvt.font" = "xft:MesloLGS NF:size=11";
        "font" = "7x13";

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
}
