env: {
  programs.alacritty = {
    enable = false;
    settings = {
      env = {
        TERM = "alacritty";
      };

      window = {
        dimensions = {
          columns = 0;
          lines = 0;
        };
        padding = {
          x = 8;
          y = 4;
        };
        dynamic_padding = false;
        decorations = "none";
        opacity = 1.0;
        startup_mode = "Maximized";
        title = "Terminal";
        dynamic_title = true;
        decorations_theme_varian = "Dark";
        resize_increment = false;
        option_as_alt = "Both";
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      font = {
        normal = {
          family = "MesloLGS Nerd Font";
        };
        bold = {
          family = "MesloLGS Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "MesloLGS Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "MesloLGS Nerd Font";
          style = "Bold Italic";
        };
        size = 15;
        offset = {
          x = 0;
          y = 0;
        };
        glyph_offset = {
          x = 0;
          y = 1;
        };
        builtin_box_drawing = true;
      };

      colors = {
        primary = {
          background = "0x2a2e38";
          foreground = "0xF0FDFF";
        };
        cursor = {
          text = "0x2a2e38";
          cursor = "0xffd17f";
        };
        vi_mode_cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };
        search = {
          matches = {
            foreground = "#000000";
            background = "#ffffff";
          };
          focused_match = {
            foreground = "#000000";
            background = "#ffffff";
          };
        };
        hints = {
          start = {
            foreground = "#1d1f21";
            background = "#e9ff5e";
          };
          end = {
            foreground = "#e9ff5e";
            background = "#1d1f21";
          };
        };
        line_indicator = {
          foreground = "None";
          background = "None";
        };
        footer_bar = {
          foreground = "#c5c8c6";
          background = "#1d1f21";
        };
        # selection = {
        #   text = "0x2a2e38";
        #   cursor = "0xF0FDFF";
        # };
        normal = {
          black = "0x2a2e38";
          red = "0xd08785";
          green = "0x6f98b3";
          yellow = "0xfdf8ce";
          blue = "0xa6b8cc";
          magenta = "0xfcdbd9";
          cyan = "0xffd17f";
          white = "0xf0fdff";
        };
        bright = {
          black = "0x71798a";
          red = "0xff3334";
          green = "0x9ec400";
          yellow = "0xe7c547";
          blue = "0x7aa6da";
          magenta = "0xb77ee0";
          cyan = "0x54ced6";
          white = "0xffffff";
        };
        dim = {
          black = "0x333333";
          red = "0xf2777a";
          green = "0x99cc99";
          yellow = "0xffcc66";
          blue = "0x6699cc";
          magenta = "0xcc99cc";
          cyan = "0x66cccc";
          white = "0xdddddd";
        };
        indexed_colors = [ ];
        transparent_background_colors = false;
      };

      bell = {
        animation = "EaseOutExpo";
        duration = 0;
        color = "#ffffff";
      };

      selection = {
        semantic_escape_chars = '',│`|:"' ()[]{}<>'';
        save_to_clipboard = false;
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
        vi_mode_style = {
          shape = "Block";
          blinking = "On";
        };
        blink_interval = 750;
        blink_timeout = 5;
        unfocused_hollow = true;
        thickness = 0.15;
      };

      live_config_reload = true;

      shell = {
        program = "/etc/profiles/per-user/" + env.user + "/bin/zsh";
        args = [ "-l" ];
      };

      working_directory = "None";

      ipc_socket = true;

      mouse = {
        double_click = {
          threshold = 300;
        };
        triple_click = {
          threshold = 300;
        };
        hide_when_typing = false;
      };

      tabspaces = 4;
      draw_bold_text_with_bright_colors = true;

      debug = {
        render_timer = false;
        persistent_logging = false;
        log_level = "Warn";
        renderer = "None";
        print_events = false;
        highlight_damage = false;
      };

      # hints

      # mouse_bindings = [{
      #   mouse = "Middle";
      #   action = "PasteSelection";
      # }];

      key_bindings = [
        {
          key = "N";
          mods = "Command";
          action = "SpawnNewInstance";
        }
        {
          key = "V";
          mods = "Command";
          action = "Paste";
        }
        {
          key = "C";
          mods = "Command";
          action = "Copy";
        }
        {
          key = "V";
          mods = "Control|Shift";
          action = "Paste";
        }
        {
          key = "C";
          mods = "Control|Shift";
          action = "Copy";
        }
        {
          key = "Paste";
          action = "Paste";
        }
        {
          key = "Copy";
          action = "Copy";
        }
        {
          key = "H";
          mods = "Command";
          action = "Hide";
        }
        {
          key = "Q";
          mods = "Command";
          action = "Quit";
        }
        {
          key = "W";
          mods = "Command";
          action = "Quit";
        }
        {
          key = "Key0";
          mods = "Command";
          action = "ResetFontSize";
        }
        {
          key = "Equals";
          mods = "Command";
          action = "IncreaseFontSize";
        }
        {
          key = "Minus";
          mods = "Command";
          action = "DecreaseFontSize";
        }
      ];
    };
  };
}
