{ pkgs, config, ... } :
{
  programs.tmux = {
    clock24 = true;
    keyMode = "vi";
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-plugins "cpu-usage ram-usage weather"
          set -g @dracula-show-flags true
          set -g @dracula-show-left-icon session
          set -g @dracula-show-fahrenheit false
          set -g @dracula-refresh-rate 10
        '';
      }
    ];
  };
}
