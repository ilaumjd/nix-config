{
  description = "iam's Darwin and Home Manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      ...
    }:
    let
      env = import ./env.nix;
      pkgs = import nixpkgs {
        system = env.system;
        config.allowUnfree = true;
        config.allowUnfreePredicate = pkgs: true;
      };
    in
    {
      darwinConfigurations = {
        ${env.hostname} = nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit env;
          };
          modules = [

            # Darwin
            ./configuration.nix

            # Nixpkgs
            {
              nixpkgs = {
                pkgs = pkgs;
                hostPlatform = pkgs.stdenv.system;
              };
            }

          ];
        };
      };
    };
}
