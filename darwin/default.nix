{ pkgs, ... }:

{

  # DO NOT CHANGE!!!
  system.stateVersion = 4;

  # Darwin configs
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Paths
  users.users.iam.home = "/Users/iam";
  environment.systemPath = [ "/opt/homebrew/bin" ];
  environment.pathsToLink = [ "/Applications" ];

  # Shell
  programs = {
    bash.enable = true;
    zsh.enable = true;
    fish.enable = true;
  };
  environment.shells = with pkgs; [
    bash
    zsh
    fish
  ];
  environment.loginShell = pkgs.fish;

  # System settings
  system.defaults = import ./system.nix;

  # Homebrew
  homebrew = import ./brew.nix;

  # Fonts
  fonts = import ./fonts.nix pkgs;

}
