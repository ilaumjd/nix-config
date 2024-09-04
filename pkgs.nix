system: nixpkgs: stable: nixgl:
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
in
import nixpkgs {
  system = system;
  overlays = [
    (overlayForSystem system)
    nixgl.overlay
  ];
  config.allowUnfree = true;
  config.allowUnfreePredicate = pkgs: true;
}
