{ nixpkgs, env, nix-darwin, home-manager }:

{
  ${env.hostname} = nix-darwin.lib.darwinSystem {
    specialArgs = { inherit env; };
    modules = [
      ./configuration.nix
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit env; };
        home-manager.users.${env.user} = import ../home;
      }
    ];
  };
}

