{
  programs.yazi = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      manager = {
        linemode = "size";
      };
    };
  };
}
