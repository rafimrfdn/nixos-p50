{config, pkgs, ...}:

{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    newSession = true;
    shortcut = "a";
    plugins = [
      pkgs.tmuxPlugins.nord
      pkgs.tmuxPlugins.yank
      pkgs.tmuxPlugins.sensible
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.continuum
    ];
    extraConfig = "
      # set-option -g status-position top
      
      set-option -g mouse on
      # easy-to-remember split pane commands
      bind | split-window -h -c '#{pane_current_path}'
      bind - split-window -v -c '#{pane_current_path}'
      bind c new-window -c '#{pane_current_path}'

      # Navigasi pakai ALT+hjkl
      bind -n M-h 'select-pane -L'
      bind -n M-j 'select-pane -D'
      bind -n M-k 'select-pane -U'
      bind -n M-l 'select-pane -R'
    ";
  };
}
