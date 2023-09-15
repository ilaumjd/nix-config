{
  description = "iam's Darwin and Home Manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager }:
    let
      env = import ./env.nix;
    in
    {

      # Darwin
      darwinConfigurations = {
        ${env.hostname} = nix-darwin.lib.darwinSystem {
          specialArgs = { inherit env; };
          modules = [
            ./darwin
          ];
        };
      };

      # Home Manager
      homeConfigurations = {
        "${env.user}@${env.hostname}" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."${env.system}";
          extraSpecialArgs = { inherit env; };
          modules = [
            ./home
          ];
        };
      };

    };
}
