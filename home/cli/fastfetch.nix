{
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = " ";
      };
      modules = [
        "break"
        "break"
        {
          type = "title";
          key = "╭─";
          format = "{user-name}@{host-name}";
          keyColor = "green";
        }
        {
          type = "os";
          key = "├─{icon}";
          keyColor = "green";
        }
        {
          type = "kernel";
          key = "├─";
          keyColor = "green";
        }
        {
          type = "packages";
          key = "╰─󰏖";
          keyColor = "green";
        }
        "break"
        {
          type = "host";
          key = "╭─󰌢";
          keyColor = "yellow";
        }
        {
          type = "cpu";
          key = "├─󰻠";
          keyColor = "yellow";
        }
        {
          type = "gpu";
          key = "├─󰍛";
          keyColor = "yellow";
        }
        {
          type = "memory";
          key = "╰─󰑭";
          keyColor = "yellow";
        }
        "break"
        {
          type = "shell";
          key = "╭─";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = "├─";
          keyColor = "blue";
        }
        {
          type = "terminalfont";
          key = "├─";
          keyColor = "blue";
        }
        {
          type = "de";
          key = "├─";
          keyColor = "blue";
        }
        {
          type = "wm";
          key = "╰─";
          keyColor = "blue";
        }
        "break"
      ];
    };
  };
}
