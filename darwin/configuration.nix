{ pkgs, env, ... }:
{
  # Enable Nix Daemon
  services.nix-daemon.enable = true;

  # State Version
  system.stateVersion = 4;

  nixpkgs.hostPlatform = pkgs.stdenv.system;

  # Nix Configs
  nix = {
    gc = {
      user = "root";
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.latest;
  };

  # User Configs
  users.users.${env.user} = {
    name = env.user;
    home = /Users/${env.user};
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
    (import ./brew.nix pkgs)
  ];
}
