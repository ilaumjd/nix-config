pkgs:
let

  default = with pkgs; [
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
    vscode

    # android
    android-file-transfer
    android-tools

    # neovim
    neovim
    cargo
    nixfmt-rfc-style
    nodejs_20
    rust-analyzer
    shfmt
    stylua
    nodePackages.prettier
  ];

  darwin = with pkgs; [
    act
    postman
    slack
    zoom-us
  ];

  linux = with pkgs; [
    firefox
    qbittorrent

    # games
    bottles
    lutris
    steam
    wine

    # fonts
    (nerdfonts.override {
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
in
{
  home.packages = default ++ (if pkgs.stdenv.isDarwin then darwin else linux);
}
