{ pkgs, env, ... }:

{

  # Enable Nix Daemon
  services.nix-daemon.enable = true;

  # State Version
  system.stateVersion = 4;

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

  # User Configs
  users.users.${env.user} = {
    name = env.user;
    home = env.home_path;
  };

  # Environment Configs
  environment = {
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };

  imports = [
    (import ./system.nix)
    (import ./fonts.nix pkgs)
    (import ./shell.nix pkgs)
    (import ./brew.nix env)
  ];
}
