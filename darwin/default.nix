{ pkgs, ... }:

{

  # DO NOT CHANGE!!!
  system.stateVersion = 4;

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Paths
  users.users.iam.home = "/Users/iam";
  environment.systemPath = [ "/opt/homebrew/bin" ];
  environment.pathsToLink = [ "/Applications" ];

  # Shell
  programs.zsh.enable = true;
  programs.fish.enable = true;
  environment.shells = with pkgs; [
    zsh
    fish
  ];
  environment.loginShell = pkgs.fish;

  # System Settings
  system.defaults.finder._FXShowPosixPathInTitle = true;
  system.defaults.NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
  system.defaults.dock.autohide = true;
  system.defaults.dock.mru-spaces = false;
  system.defaults.finder.QuitMenuItem = true;
  system.defaults.finder.ShowPathbar = true;
  system.defaults.loginwindow.GuestEnabled = false;
  system.defaults.trackpad.Clicking = true;

  # Fonts
  fonts = import ./fonts.nix pkgs;

  # Homebrew
  homebrew = import ./brew.nix;

}
