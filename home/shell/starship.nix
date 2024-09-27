{
  programs.starship = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = false;
    enableFishIntegration = true;
    settings = {
      format = "$directory$character";
      right_format = "$git_branch$git_status $all";
      add_newline = false;
      directory = {
        style = "bold cyan";
        truncation_length = 3;
        truncate_to_repo = false;
      };
      git_branch = {
        format = "[$symbol$branch]($style) ";
        style = "bold purple";
        symbol = " ";
      };
      git_status = {
        format = "([\\[$all_status$ahead_behind\\]]($style))";
        style = "bold red";
        conflicted = "=";
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        untracked = "?";
        stashed = "\\$";
        modified = "!";
        staged = "+";
        renamed = "»";
        deleted = "✘";
      };
      character = {
        success_symbol = "[➤](bold green)";
        error_symbol = "[➤](bold red)";
        vimcmd_symbol = "[❮](bold green)";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
        min_time = 500;
      };
    };
  };
}
