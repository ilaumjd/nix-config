{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      on_force_close = "detach";
      simplified_ui = false;
      pane_frames = false;
      theme = "catppuccin-frappe";
      default_layout = "default";
      default_mode = "normal";
      mouse_mode = true;
      scroll_buffer_size = 10000;
      copy_clipboard = "system";
      copy_on_select = false;
      mirror_session = false;
      ui = {
        pane_frames = {
          rounded_corners = true;
          hide_session_name = true;
        };
      };
    };
  };
}
