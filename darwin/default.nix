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

  # Shells
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

  # System Settings
  system.defaults = import ./system.nix;
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # Homebrew
  homebrew = import ./brew.nix env;

  # Fonts
  fonts = import ./fonts.nix pkgs;

  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    extraConfig = builtins.readFile ./yabairc;
  };

  services.skhd = {
    enable = true;
    skhdConfig = builtins.readFile ./skhdrc;
  };
}
