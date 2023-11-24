env: nixneovimplugins:
{
  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnfreePredicate = pkgs: true;
    overlays = [ nixneovimplugins.overlays.default ];
  };
}
