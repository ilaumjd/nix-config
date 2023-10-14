pkgs: {
  home.packages = with pkgs; [
    # aw
    bottom
    btop
    htop
    neofetch

    # cli
    dua
    fd
    ripgrep
    tealdeer
    tokei
    translate-shell
    trash-cli
    wget
    xh

    # gui
    vscodium

    # formatter
    nixfmt
    shfmt
    stylua
    nodePackages.prettier
  ];
}
