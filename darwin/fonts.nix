pkgs: {
  fonts = {
    packages = [
      (pkgs.nerdfonts.override {
        fonts = [
          "CascadiaCode"
          "FiraCode"
          "Hack"
          "Meslo"
          "Mononoki"
          "SourceCodePro"
        ];
      })
    ];
  };
}
