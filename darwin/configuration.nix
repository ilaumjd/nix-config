{ pkgs, env, ... }:

{

  # DO NOT CHANGE!!!
  system.stateVersion = 4;

  # Enable Nix Daemon
  services.nix-daemon.enable = true;

  # Nix Configs
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
    };
    gc = {
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.unstable;
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };

  # Nixpkgs Configs
  nixpkgs = {
    hostPlatform = env.system;
    config.allowUnfree = true;
    config.allowUnfreePredicate = (pkgs: true);
  };

  # Paths
  users.users.${env.user}.home = "/Users/${env.user}";
  environment.systemPath = [ "/opt/homebrew/bin" ];
  environment.pathsToLink = [ "/Applications" ];

  imports = [
    (import ./system.nix)
    (import ./fonts.nix pkgs)
    (import ./shell.nix pkgs)
    (import ./brew.nix env)
  ];
}
