{ env, nix-darwin, home-manager, nixvim, nixneovimplugins }: {
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
            nixvim.homeManagerModules.nixvim
            {
              targets.darwin.currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage =
                true;
            }
          ];
        };
      }

      # Nixpkgs Configs
      (import ../nixpkgs.nix env nixneovimplugins)

    ];
  };
}
