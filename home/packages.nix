pkgs:
let

  default = with pkgs; [
    # cli
    bottom
    dua
    fastfetch
    fd
    htop
    jq
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
    apktool

    # neovim
    neovim
    tree-sitter
    nixfmt-rfc-style
    shfmt
    stylua
    nodePackages.prettier
  ];

  darwin = with pkgs; [
    act
    localsend
    postman
    slack
    zoom-us
  ];

  linux = with pkgs; [
    # gui
    firefox
    qbittorrent

    # games
    bottles
    lutris
    steam
    wine

    # tools
    wl-clipboard

    # gnome
    gnome-tweaks
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.dash-to-dock
    gnomeExtensions.pano
    gnomeExtensions.paperwm
    gnomeExtensions.search-light
    gnomeExtensions.user-themes
    gnomeExtensions.wiggle

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
