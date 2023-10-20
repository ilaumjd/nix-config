pkgs: env:
let

  groups = with pkgs; {

    default = [
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
    ];

    darwin = [ utm ];

    formatter = [ nixfmt shfmt stylua nodePackages.prettier ];

    works = [ slack zoom-us ];

  };
in {
  home.packages =
    builtins.concatLists (builtins.map (x: groups."${x}") env.package_groups);
}
