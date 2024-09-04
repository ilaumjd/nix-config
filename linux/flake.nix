{
  description = "iam's Standalone Home Manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixgl.url = "github:nix-community/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixgl,
      ...
    }:
    let
      env = import ../env.nix;
    in
    {

      homeConfigurations."${env.user}" = import ./standalone.nix {
        inherit
          env
          nixpkgs
          home-manager
          nixgl
          ;
      };

    };
}
