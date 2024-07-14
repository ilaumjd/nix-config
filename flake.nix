{
  description = "iam's Darwin and Home Manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }:
    let
      env = import ./env.nix;
    in
    {
      # Darwin
      darwinConfigurations = import ./darwin { inherit env nix-darwin home-manager; };

      # NixOS
      nixosConfigurations = import ./nixos { inherit env nixpkgs home-manager; };
    };
}
