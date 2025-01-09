pkgs: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    prefix = "C-s";
    sensibleOnTop = false;
    terminal = "screen-256color";
    plugins = with pkgs.tmuxPlugins; [
      session-wizard
      tmux-fzf
      vim-tmux-navigator
      {
        plugin = tmux-nova;
        extraConfig = ''
          set -g @nova-nerdfonts true
          # set -g @nova-nerdfonts-left 
          # set -g @nova-nerdfonts-right 

          set -g @nova-pane-active-border-style "#44475a"
          set -g @nova-pane-border-style "#282a36"
          set -g @nova-status-style-bg "#4c566a"
          set -g @nova-status-style-fg "#d8dee9"
          set -g @nova-status-style-active-bg "#89c0d0"
          set -g @nova-status-style-active-fg "#2e3540"
          set -g @nova-status-style-double-bg "#2d3540"

          set -g @nova-pane "#I#{?pane_in_mode,  #{pane_mode},}  #W"

          set -g @nova-segment-mode "#{?client_prefix,󰀨,}"
          set -g @nova-segment-mode-colors "#78a2c1 #2e3440"

          set -g @nova-segment-whoami "#(whoami)@#h"
          set -g @nova-segment-whoami-colors "#78a2c1 #2e3440"

          set -g @nova-rows 0
          set -g @nova-segments-0-left "mode"
          set -g @nova-segments-0-right "whoami"
        '';
      }
    ];
    extraConfig = ''
      # AUTO RENAME
      set-option -g status-interval 1
      set-option -g automatic-rename on
      set-option -g automatic-rename-format '#{b:pane_current_path}'

      # RELOAD
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      # WINDOWS
      bind t new-window -c "#{pane_current_path}"
      bind x confirm-before -p "kill-window #W?" kill-window

      # PANES
      bind w confirm-before -p "kill-pane #P?" kill-pane
      bind \\ split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}

      # CLEAR 
      bind C-l send-keys 'C-l'
    '';
  };
}
