pkgs:
let

  default = with pkgs; [
    # cli
    bottom
    fd
    htop
    jq
    ripgrep
    tealdeer
    trash-cli
    wget

    # # optional
    # dua
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
    # act
    localsend
    # postman
    slack
    zoom-us
  ];

  linux = with pkgs; [
    # fonts
    inter

    # cli
    ffmpeg
    p7zip
    unrar-free
    unzip

    # gui
    mpv-unwrapped

    # gaming
    legendary-gl
    wineWow64Packages.wayland

    # wm
    blueberry
    dunst
    eww
    xdg-utils
    xfce.thunar

    # wayland
    hypridle
    rofi-wayland
    swaybg
    # wev
    wf-recorder
    wl-clipboard
    xwayland-satellite

    # x11
    # picom
    # scrot
    # simplescreenrecorder
    # xidlehook
    # xsel

  ];

  fonts = import ../fonts.nix pkgs;
in
{
  home.packages = default ++ (if pkgs.stdenv.isDarwin then darwin else linux ++ fonts);
}
