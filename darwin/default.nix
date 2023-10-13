{ env, nix-darwin, home-manager, }: {
  ${env.hostname} = nix-darwin.lib.darwinSystem {
    specialArgs = { inherit env; };
    modules = [
      # Darwin
      ./configuration.nix

      # Home Manager
      home-manager.darwinModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit env; };
          users.${env.user}.imports = [
            ../home
            {
              targets.darwin.currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage =
                true;
            }
          ];
        };
      }
    ];
  };
}
