{
  env,
  nixpkgs,
  home-manager,
}:
let
  pkgs = nixpkgs.pkgs;
  nixGLWrap = import ./nixgl.nix pkgs;
in
home-manager.lib.homeManagerConfiguration {
  pkgs = pkgs;
  extraSpecialArgs = {
    inherit env;
  };
  modules = [
    ./.

    # Nix Settings
    (import ../nix-settings.nix env)

    {
      nix.package = pkgs.nixVersions.git;
      programs.kitty.package = nixGLWrap pkgs.kitty;
      programs.wezterm.package = nixGLWrap pkgs.wezterm;
    }
  ];
}
