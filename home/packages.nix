pkgs: env:
let

  groups = with pkgs; {

    default = [
      bottom
      dua
      fd
      htop
      neofetch
      pfetch
      ripgrep
      tealdeer
      tokei
      translate-shell
      trash-cli
      wget
      xh
    ];

    darwin = [ utm ];

    linux = [
      brave
      firefox
      steam
      lutris
      (pkgs.nerdfonts.override {
        fonts = [
          "CascadiaCode"
          "FiraCode"
          "Hack"
          "JetBrainsMono"
          "Meslo"
          "Mononoki"
          "RobotoMono"
          "SourceCodePro"
        ];
      })
      mpv
    ];

    formatter = [ nixfmt shfmt stylua nodePackages.prettier ];

    works = [ slack vscodium zoom-us ];

  };
in
{
  home.packages =
    builtins.concatLists (builtins.map (x: groups."${x}") env.package_groups);
}
