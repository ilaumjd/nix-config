{
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    enableFishIntegration = false;
    settings = builtins.fromJSON (builtins.readFile ./oh-my-posh.json);
  };
}
