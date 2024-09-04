{
  env,
  nixpkgs,
  nix-darwin,
  home-manager,
}:
{
  ${env.hostname} = nix-darwin.lib.darwinSystem {
    specialArgs = {
      inherit env;
    };
    modules = [

      # Darwin
      ./configuration.nix

      # Nix Settings
      (import ../nix-settings.nix)

      # Nixpkgs
      {
        nixpkgs.pkgs = import nixpkgs {
          system = env.system;
          config.allowUnfree = true;
          config.allowUnfreePredicate = pkgs: true;
        };
      }

      # Home Manager
      home-manager.darwinModules.home-manager
      {
        home-manager = {
          backupFileExtension = "backup";
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${env.user}.imports = [
            ../home
            { targets.darwin.currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true; }
          ];
        };
      }
    ];
  };
}
