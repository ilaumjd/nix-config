{ pkgs, ... }:

{
  fontDir.enable = true;
  fonts = [
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
}
