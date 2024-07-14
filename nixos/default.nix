{
  env,
  nixpkgs,
  home-manager,
}:
{
  ${env.hostname} = nixpkgs.lib.nixosSystem {
    system = env.system;
    modules = [

      # NixOS
      ./configuration.nix

      # Nix Settings
      (import ../nix-settings.nix env)

      # Home Manager
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit env;
          };
          users.${env.user}.imports = [ ../home ];
        };
      }
    ];
  };
}
