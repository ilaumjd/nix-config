{ pkgs, env, ... }:

{

  # DO NOT CHANGE!!!
  system.stateVersion = 4;

  # Darwin Configs
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = env.system;

  # Paths
  users.users.${env.user}.home = "/Users/${env.user}";
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

  # System Settings
  system.defaults = import ./system.nix;

  # Homebrew
  homebrew = import ./brew.nix;

  # Fonts
  fonts = import ./fonts.nix pkgs;

}
