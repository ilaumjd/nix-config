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

    # fonts
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.meslo-lg
    nerd-fonts.mononoki
    nerd-fonts.sauce-code-pro

    # x11
    eww
    picom
    rofi
    xsel

    # wayland
    # wl-clipboard

  ];
in
{
  home.packages = default ++ (if pkgs.stdenv.isDarwin then darwin else linux);
}
