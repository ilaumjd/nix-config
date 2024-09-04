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
}
