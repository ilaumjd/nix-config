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

            # Nix Settings
            (import ../nix-settings.nix pkgs)

            # Nixpkgs
            { nixpkgs.pkgs = pkgs; }

            # Home Manager
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                backupFileExtension = "backup";
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${env.user}.imports = [
                  ../home

                  { targets.darwin.currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true; }

                  (if pkgs.stdenv.isDarwin then { programs.wezterm.package = pkgs.hello; } else { })
                ];
              };
            }
          ];
        };
      };
    };
}
