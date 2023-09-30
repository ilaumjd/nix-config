{
  programs.fish = {
    enable = true;
    shellAbbrs = import ./alias.nix;
  };
}
