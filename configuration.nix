{ pkgs, env, ... }:
{
  # State Version
  system.stateVersion = 5;

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

  imports = [
    (import ./brew.nix)
    (import ./fonts.nix pkgs)
    (import ./shell.nix pkgs)
    (import ./system.nix)
  ];

}
