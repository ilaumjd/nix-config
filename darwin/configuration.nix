{ pkgs, env, ... }:
{
  # State Version
  system.stateVersion = 5;

  nixpkgs.hostPlatform = pkgs.stdenv.system;

  # Nix Configs
  nix = {
    enable = false;
    #    gc = {
    #      automatic = true;
    #      interval.Day = 7;
    #      options = "--delete-older-than 7d";
    #    };
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

  fonts = {
    packages = import ../fonts.nix pkgs;
  };

  imports = [
    (import ./system.nix)
    (import ./shell.nix pkgs)
    (import ./brew.nix)
  ];

}
