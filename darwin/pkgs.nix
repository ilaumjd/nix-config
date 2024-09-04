system: nixpkgs: stable:
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
  overlays = [ (overlayForSystem system) ];
}
