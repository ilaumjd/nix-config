nixpkgs: stable: env:
let
  overlayForSystem =
    system:
    if system == "x86_64-darwin" then
      (
        final: prev: with stable.legacyPackages.${system}; {
          wezterm = wezterm;
        }
      )
    else
      (final: prev: { });

  pkgs = import nixpkgs {
    system = env.system;
    overlays = [ (overlayForSystem env.system) ];
    config.allowUnfree = true;
    config.allowUnfreePredicate = pkgs: true;
  };

in
{
  nixpkgs.pkgs = pkgs;
}
