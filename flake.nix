{
  description = "iam's Darwin and Home Manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixgl.url = "github:nix-community/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
    stable.url = "github:NixOS/nixpkgs/nixos-23.05-small";
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      home-manager,
      nixgl,
      stable,
      ...
    }:
    let
      env = import ./env.nix;
      my-pkgs = import ./pkgs.nix env.system nixpkgs stable nixgl;
    in
    {
      # Darwin
      darwinConfigurations = import ./darwin {
        inherit env nix-darwin home-manager;
        pkgs = my-pkgs;
      };

      # Home Manager
      homeConfigurations."${env.user}" = import ./home/standalone.nix {
        inherit env home-manager;
        pkgs = my-pkgs;
      };

    };
}
