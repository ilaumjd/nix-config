{
  description = "iam's Darwin and Home Manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixgl.url = "github:nix-community/nixGL";
    gbar.url = "github:scorpion-26/gBar";
  };

  outputs = { nixpkgs, nix-darwin, home-manager, nixvim, nixgl, gbar, ... }:
    let env = import ./env.nix;
    in
    {
      # Darwin
      darwinConfigurations = import ./darwin {
        inherit env nix-darwin home-manager nixvim;
      };

      # NixOS
      nixosConfigurations = import ./nixos {
        inherit env nixpkgs home-manager nixvim;
      };

      # Home Manager
      homeConfigurations."${env.user}" = import ./home/standalone.nix {
        inherit env nixpkgs home-manager nixvim nixgl gbar;
      };

    };
}
