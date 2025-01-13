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
          set -g @nova-nerdfonts false

          set -g @nova-pane-active-border-style "#9ccfd8"
          set -g @nova-pane-border-style "#6e6a86"
          set -g @nova-status-style-bg "#191724"
          set -g @nova-status-style-fg "#ebbcba"
          set -g @nova-status-style-active-bg "#ebbcba"
          set -g @nova-status-style-active-fg "#191724"

          set -g @nova-pane "#I#{?pane_in_mode,  #{pane_mode},}  #W"

          set -g @nova-segment-mode "#{?client_prefix,󰀨,}"
          set -g @nova-segment-mode-colors "#191724 #ebbcba "

          # set -g @nova-segment-whoami "#(whoami)@#h"
          # set -g @nova-segment-whoami-colors "#ebbcba #191724"

          set -g @nova-rows 0
          set -g @nova-segments-0-left "mode"
          # set -g @nova-segments-0-right "whoami"
        '';
      }
    ];
    extraConfig = ''
      # STATUS BAR
      set -g status-position top

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
      bind s choose-tree -Zw

      # PANES
      bind w confirm-before -p "kill-pane #P?" kill-pane
      bind \\ split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # CLEAR 
      bind l send-keys C-l
      bind k clear-history
      bind -n M-l send-keys C-l
      bind -n M-k clear-history
    '';
  };
}
