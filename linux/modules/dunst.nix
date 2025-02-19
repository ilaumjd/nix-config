{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "none";
        width = 350;
        height = 200;
        origin = "top-right";
        offset = "30x25";
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 0;
        progress_bar_min_width = 125;
        progress_bar_max_width = 250;
        progress_bar_corner_radius = 4;
        icon_corner_radius = 5;
        close_all = "ctrl+space";
        history = "mod1+grave";
        indicate_hidden = true;
        shrink = false;
        transparency = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 10;
        text_icon_padding = 10;
        frame_width = 1;
        gap_size = 5;
        separator_color = "auto";
        sort = true;
        idle_threshold = 0;
        font = "Inter 11";
        line_height = 3;
        markup = "full";
        format = "   %a\n<b>%s</b>\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = -1;
        word_wrap = true;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = false;
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 96;
        sticky_history = false;
        history_length = 20;
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 10;
        ignore_dbusclose = false;
        force_xinerama = false;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
        background = "#191724";
      };
      urgency_low = {
        foreground = "#f6c177";
        frame_color = "#f6c177";
      };
      urgency_normal = {
        foreground = "#9ccfd8";
        frame_color = "#9ccfd8";
      };
      urgency_critical = {
        foreground = "#eb6f92";
        frame_color = "#eb6f92";
      };
    };
  };
}
