{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = import ./alias.nix;
  };
}
