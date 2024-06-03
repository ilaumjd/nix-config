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

    darwin = [ vscodium ];

    linux = [
      brave
      firefox
      mpv
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
    ];

    formatter = [
      nixfmt
      shfmt
      stylua
      nodePackages.prettier
    ];

    games = [
      bottles
      lutris
      steam
      wine
    ];

  };
in
{
  home.packages =
    builtins.concatLists (builtins.map (x: groups."${x}") env.package_groups);
}
