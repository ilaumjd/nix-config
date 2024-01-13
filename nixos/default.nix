{ env, nixpkgs, home-manager, nixvim, nixneovimplugins }: {
  ${env.hostname} = nixpkgs.lib.nixosSystem {
    system = env.system;
    modules = [

      # NixOS
      ./configuration.nix

      # Nix Settings
      (import ../nix-settings.nix env nixneovimplugins)

      # Home Manager
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit env; };
          users.${env.user}.imports = [
            ../home
            nixvim.homeManagerModules.nixvim
          ];
        };
      }
    ];
  };
}
