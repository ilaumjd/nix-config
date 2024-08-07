{
  description = "iam's Darwin and Home Manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stable.url = "github:NixOS/nixpkgs/nixos-23.05-small";
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      home-manager,
      stable,
      ...
    }:
    let
      env = import ./env.nix;
      my-nixpkgs = import ./nixpkgs.nix nixpkgs stable env;
    in
    {
      # Darwin
      darwinConfigurations = import ./darwin {
        inherit
          env
          my-nixpkgs
          nix-darwin
          home-manager
          ;
      };

      # NixOS
      nixosConfigurations = import ./nixos { inherit env nixpkgs home-manager; };
    };
}
