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
    ripgrep
    tealdeer
    trash-cli
    wget

    # # optional
    # ngrok
    # pfetch
    # tokei
    # translate-shell
    # xh
    #
    # # gui
    # discord
    # qbittorrent
    # vscode
    #
    # # android
    # android-file-transfer
    # android-tools
    # apktool
    # scrcpy

    # neovim
    neovim
    tree-sitter
    kdlfmt
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
    mpv

    # wm
    blueberry
    dunst
    eww
    ffmpeg
    inter
    eog
    # rofimoji
    rofi-power-menu
    # sass

    # x11
    # picom
    # scrot
    # simplescreenrecorder
    # xidlehook
    # xsel

    # wayland
    hypridle
    rofi-wayland
    swww
    wev
    wf-recorder
    wl-clipboard
    xwayland-satellite
  ];

  fonts = import ../fonts.nix pkgs;
in
{
  home.packages = default ++ (if pkgs.stdenv.isDarwin then darwin else linux ++ fonts);
}
