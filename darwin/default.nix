{
  env,
  my-nixpkgs,
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
      (import ../nix-settings.nix env)

      my-nixpkgs

      # Home Manager
      home-manager.darwinModules.home-manager
      {
        home-manager = {
          backupFileExtension = "backup";
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit env;
          };
          users.${env.user}.imports = [
            ../home
            { targets.darwin.currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true; }
          ];
        };
      }
    ];
  };
}
