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
    gbar.url = "github:scorpion-26/gBar";
  };

  outputs = { nixpkgs, nix-darwin, home-manager, nixvim, nixneovimplugins, nixgl, gbar, ... }:
    let env = import ./env.nix;
    in
    {
      # Darwin
      darwinConfigurations = import ./darwin {
        inherit env nix-darwin home-manager nixvim nixneovimplugins;
      };

      # NixOS
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = env.system;
          modules = [
            ./configuration.nix

            (import ./nix-settings.nix env nixneovimplugins)

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit env; };
                users.${env.user}.imports = [
                  ./home
                  nixvim.homeManagerModules.nixvim
                ];
              };
            }
          ];
        };
      };

      # Home Manager
      homeConfigurations."${env.user}" = import ./home/standalone.nix {
        inherit env nixpkgs home-manager nixvim nixneovimplugins nixgl gbar;
      };

    };
}
