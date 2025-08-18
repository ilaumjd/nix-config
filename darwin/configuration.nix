{ pkgs, env, ... }:
{
  # State Version
  system.stateVersion = 5;

  nixpkgs.hostPlatform = pkgs.stdenv.system;

  # Nix Configs
  nix = {
    enable = false;
    settings = {
      experimental-features = "nix-command flakes";
    };
  };

  # User Configs
  users.users.${env.user} = {
    name = env.user;
    home = /Users/${env.user};
  };

  system.primaryUser = env.user;

  # Environment Configs
  environment = {
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
    defaultPackages = import ./packages.nix pkgs;
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
