system: srcpkgs:
let
  overlayForSystem =
    system:
    if system == "x86_64-darwin" then
      (
        final: prev: with srcpkgs.legacyPackages.${system}; {
          wezterm = wezterm;
        }
      )
    else
      (final: prev: { });
in
[ (overlayForSystem system) ]
