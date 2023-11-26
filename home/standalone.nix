{ env, nixpkgs, home-manager, nixvim, nixneovimplugins, nixgl }:
let
  pkgs = import nixpkgs {
    system = "${env.system}";
    overlays = [ nixgl.overlay ];
  };
  nixGLWrap = import ./nixgl.nix pkgs;
in
home-manager.lib.homeManagerConfiguration {
  pkgs = pkgs;
  extraSpecialArgs = { inherit env; };
  modules = [
    ./.
    nixvim.homeManagerModules.nixvim
    (import ../nix-settings.nix env nixneovimplugins)
    {
      nix.package = pkgs.nixVersions.unstable;
      programs.wezterm.package = nixGLWrap pkgs.wezterm;
      programs.alacritty.package = nixGLWrap pkgs.alacritty;
    }
  ];
}
