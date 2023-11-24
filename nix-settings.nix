env: nixneovimplugins:
{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
    };
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };
  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnfreePredicate = pkgs: true;
    overlays = [ nixneovimplugins.overlays.default ];
  };
}
