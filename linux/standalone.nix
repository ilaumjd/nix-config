{
  env,
  nixpkgs,
  home-manager,
  nixgl,
}:
let
  pkgs = import nixpkgs {
    system = env.system;
    config.allowUnfree = true;
    config.allowUnfreePredicate = pkgs: true;
    overlays = [ nixgl.overlay ];
  };
  nixGLWrap = import ./nixgl.nix pkgs;
in
home-manager.lib.homeManagerConfiguration {
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
    (import ../nix-settings.nix)

    {
      nix.package = pkgs.nixVersions.git;
      programs.kitty.package = nixGLWrap pkgs.kitty;
      programs.wezterm.package = nixGLWrap pkgs.wezterm;
    }
  ];
}
