{
  programs.bash = {
    enable = false;
    enableCompletion = true;
    shellAliases = import ./alias.nix;
  };
}
