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
      env = import ./env.nix;
      pkgs = import nixpkgs {
        system = env.system;
        config.allowUnfree = true;
        config.allowUnfreePredicate = pkgs: true;
        overlays = [ nixgl.overlay ];
      };
      nixGLWrap = import ./nixgl.nix pkgs;
    in
    {

      homeConfigurations."${env.user}" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [

          # Home Manager
          ../home

          # Home Configs
          {
            home.username = env.user;
            home.homeDirectory = "/home/${env.user}";
          }

          # Nix Settings
          (import ../nix-settings.nix pkgs)

          {
            programs.ghostty.package = nixGLWrap pkgs.ghostty;
            programs.kitty.package = nixGLWrap pkgs.kitty;
            programs.wezterm.package = nixGLWrap pkgs.wezterm;
          }
        ];
      };

    };
}
