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
    nixgl.url = "github:nix-community/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nix-darwin, home-manager, nixvim, nixneovimplugins, nixgl, ... }:
    let env = import ./env.nix;
    in
    {
      # Darwin
      darwinConfigurations = import ./darwin {
        inherit env nix-darwin home-manager nixvim nixneovimplugins;
      };

      # Home Manager
      homeConfigurations."${env.user}" = import ./home/standalone.nix {
        inherit env nixpkgs home-manager nixvim nixneovimplugins nixgl;
      };

    };
}
