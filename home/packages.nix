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
    ngrok
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
    qbittorrent
    vscode

    # android
    android-file-transfer
    android-tools
    apktool
    scrcpy

    # neovim
    neovim
    tree-sitter
    nixfmt-rfc-style
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
    mpv

    # games
    bottles
    lutris
    steam
    wine

    # x11
    eww
    picom
    rofi
    xsel

    # wayland
    # wl-clipboard

  ];

  fonts = import ../fonts.nix pkgs;
in
{
  home.packages = default ++ (if pkgs.stdenv.isDarwin then darwin else linux ++ fonts);
}
