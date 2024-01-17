pkgs: env:
let

  groups = with pkgs; {

    darwin = [ ];

    default = [
      # aw
      bottom
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
    ];

    android = [
      android-file-transfer
      android-tools
      scrcpy
    ];

    formatter = [
      nixfmt
      shfmt
      stylua
      nodePackages.prettier
    ];

    personal = [
      discord
    ];

    works = [
      slack
      utm
      zoom-us
    ];

  };
in
{
  home.packages =
    builtins.concatLists (builtins.map (x: groups."${x}") env.package_groups);
}
