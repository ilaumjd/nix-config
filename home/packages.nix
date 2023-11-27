pkgs: env:
let

  nixGLWrap = import ./nixgl.nix pkgs;

  groups = with pkgs; {

    default = [
      bottom
      dua
      fd
      htop
      neofetch
      ripgrep
      tealdeer
      tokei
      translate-shell
      trash-cli
      wget
      xh
    ];

    darwin = [ utm ];

    linux = [
      (nixGLWrap kitty)
      lxqt.lximage-qt
      rofi
      dmenu
      pantheon.elementary-files
      brave
      (pkgs.nerdfonts.override {
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
      nixgl.nixGLIntel
      wev
      ironbar
    ];

    formatter = [ nixfmt shfmt stylua nodePackages.prettier ];

    works = [ slack vscodium zoom-us ];

  };
in
{
  home.packages =
    builtins.concatLists (builtins.map (x: groups."${x}") env.package_groups);
}
