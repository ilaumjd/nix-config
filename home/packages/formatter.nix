pkgs: {
  home.packages = with pkgs; [
    nixfmt
    shfmt
    stylua
    nodePackages.prettier
  ];
}
