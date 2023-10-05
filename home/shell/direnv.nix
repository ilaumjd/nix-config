{
  programs.direnv = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
