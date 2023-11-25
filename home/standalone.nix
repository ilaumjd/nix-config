{ env, nixpkgs, home-manager, nixvim, nixneovimplugins }:
home-manager.lib.homeManagerConfiguration {
  pkgs = nixpkgs.legacyPackages."${env.system}";
  extraSpecialArgs = { inherit env; };
  modules = [
    ./.
    nixvim.homeManagerModules.nixvim
    (import ../nix-settings.nix env nixneovimplugins)
    {
      nix.package = nixpkgs.legacyPackages."${env.system}".nixVersions.unstable;
    }
  ];
}
