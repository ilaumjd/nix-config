{
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = builtins.fromJSON (builtins.readFile ./oh-my-posh.json);
  };
}
