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
      set-option -g status-position top
      
      set-option -g mouse on
      # easy-to-remember split pane commands
      bind | split-window -h -c '#{pane_current_path}'
      bind - split-window -v -c '#{pane_current_path}'
      bind c new-window -c '#{pane_current_path}'

      # Navigasi pakai ctrl+hjkl
      bind -n C-h 'select-pane -L'
      bind -n C-j 'select-pane -D'
      bind -n C-k 'select-pane -U'
      bind -n C-l 'select-pane -R'
    ";
  };
}
