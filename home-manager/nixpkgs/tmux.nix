{ pkgs, config, ... } :
{
  programs.tmux = {
    clock24 = true;
    keyMode = "vi";
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-boot 'on'
        '';
      }
      {
        plugin = power-theme;
        extraConfig = ''
          set -g @tmux_power_theme 'moon'
        '';
      }
    ];
    extraConfig = ''
      # make scrolling with wheels work
      set -g mouse on

      bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" \
        "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' \
        'select-pane -t=; copy-mode -e; send-keys -M'"
      bind -n WheelDownPane select-pane -t= \; send-keys -M

      # relaoad config
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded tmux config"

      # new window / split in current path
      bind c new-window -c "#{pane_current_path}"

      unbind-key '"'
      bind - split-window -v -c "#{pane_current_path}"

      unbind-key "%"
      bind | split-window -h -c "#{pane_current_path}"

      # Copy vim style
      # create 'v' alias for selecting text
      bind Escape copy-mode
      bind C-[ copy-mode
      bind -T copy-mode-vi 'v' send -X begin-selection

      # copy with 'enter' or 'y'
      unbind -T copy-mode-vi Enter
      bind -T copy-mode-vi Enter send -X copy-pipe-and-cancel
      bind -T copy-mode-vi 'y' send -X copy-pipe-and-cancel

      # paste
      bind p paste-buffer

    '';
  };
}
