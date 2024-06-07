pkgs: env:
let

  groups = with pkgs; {

    default = [
      # cli
      bottom
      dua
      fastfetch
      fd
      htop
      pfetch
      ripgrep
      tealdeer
      tokei
      translate-shell
      trash-cli
      wget
      xh

      # gui
      discord
      mpv
      vscodium

      # formatter
      nixfmt-rfc-style
      shfmt
      stylua
      nodePackages.prettier
    ];

    darwin = [ 
      postman
      slack 
      zoom-us 
    ];

    linux = [
      brave
      firefox
      qbittorrent

      # fonts
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

      # games
      bottles
      lutris
      steam
      wine
    ];

  };
in
{
  home.packages = groups.default ++ groups."${env.os}";
}
