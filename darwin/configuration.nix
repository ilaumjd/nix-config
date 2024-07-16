{ pkgs, env, ... }:
{
  # Enable Nix Daemon
  services.nix-daemon.enable = true;

  # State Version
  system.stateVersion = 4;

  nixpkgs.hostPlatform = env.system;

  # Nix Configs
  nix = {
    #   settings = {
    #     auto-optimise-store = true;
    #     experimental-features = "nix-command flakes";
    #   };
    gc = {
      user = "root";
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.latest;
    #   extraOptions = ''
    #     keep-outputs = true
    #     keep-derivations = true
    #   '';
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
