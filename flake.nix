{
  description = "iam's Darwin and Home Manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixneovimplugins.url = "github:nixneovim/nixneovimplugins";
    nixneovimplugins.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nix-darwin, home-manager, nixvim, nixneovimplugins, ... }:
    let env = import ./env.nix;
    in
    {
      # Darwin
      darwinConfigurations = import ./darwin {
        inherit env nix-darwin home-manager nixvim nixneovimplugins;
      };

      # Home Manager
      homeConfigurations."${env.user}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."${env.system}";
        extraSpecialArgs = { inherit env; };
        modules = [
          ./home
          nixvim.homeManagerModules.nixvim
          (import ./nix-settings.nix env nixneovimplugins)
          {
            nix.package = nixpkgs.legacyPackages."${env.system}".nixVersions.unstable;
          }
        ];
      };
    };
}
