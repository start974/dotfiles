{config, ...}:
{
  services.picom.enable = true;
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 11;
    };
    # https://sw.kovidgoyal.net/kitty/conf/
    settings = {
      font_feature = "Fira Code Bold Nerd Font Complete";

      #cusor color
      cursor = "#7a5Eae";
      cursor_text_color = "#e0bef3";
      cursor_shape = "block";

      #color scheme
      foreground = "#ebdef0";
      background = "#151515";
      background_opacity = "0.95";

      # Black / grey
      color0  = "#000000";
      color8  = "#3f3f3f";

      # Red
      color1  = "#f15252";
      color9  = "#F50606";

      # Green
      color2  = "#5ddc7b";
      color10 = "#09B540";

      # Yellow
      color3  = "#e6e871";
      color11 = "#f1ef06";

      # Blue
      color4  = "#157ef1";
      color12 = "#0a54a4";

      # Magenta
      color5  = "#9c37da";
      color13 = "#640c9b";

      # Cyan
      color6  = "#0fceba";
      color14 = "#068973";

      # white
      color7  = "#e8e8e8";
      color15 = "#ffffff";

      #bell
      enable_audio_bell = false;
      window_alert_on_bell = false;
    
      editor = "vim";
    };

  };
}
