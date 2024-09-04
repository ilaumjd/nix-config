{
  env,
  pkgs,
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
      { nixpkgs.pkgs = pkgs; }

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
