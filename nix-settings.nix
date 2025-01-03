pkgs: {
  nix = {
    # optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
    };
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
    package = pkgs.nixVersions.latest;
  };
}
