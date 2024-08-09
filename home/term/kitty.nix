{
  programs.kitty = {
    enable = true;
    theme = "Gruvbox Dark Soft";
    shellIntegration = {
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
    settings = {
      shell = "/etc/profiles/per-user/iam/bin/zsh --login";
    };
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
