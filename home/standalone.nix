{
  env,
  nixpkgs,
  home-manager,
}:
home-manager.lib.homeManagerConfiguration {
  pkgs = nixpkgs.legacyPackages."${env.system}";
  extraSpecialArgs = {
    inherit env;
  };
  modules = [
    ./.
    { nix.package = nixpkgs.legacyPackages."${env.system}".nixVersions.git; }
  ];
}
