config: {
  programs.kitty = {
    enable = true;
    theme = "Apprentice";
    shellIntegration = {
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
    settings = {
      shell = "/etc/profiles/per-user/" + config.home.username + "/bin/zsh --login";
    };
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
