pkgs: {
  programs.yazi = {
    enable = true;
    package = pkgs.yazi-unwrapped;
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
