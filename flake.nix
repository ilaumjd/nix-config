{
  description = "iam's Darwin and Home Manager configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager }: {
    darwinConfigurations.macos = nix-darwin.lib.darwinSystem {
      system = "aarch64_darwin";
      modules = [
        ./darwin
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = false;
          home-manager.useUserPackages = true;
          home-manager.users.iam.imports = [ ./home ];
        }
      ];
    };
  };
}
