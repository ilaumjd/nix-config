{
  programs.fish = {
    enable = true;
    shellAbbrs = import ./alias.nix;
    shellInit = ''
      set -U fish_greeting
    '';
  };
}
