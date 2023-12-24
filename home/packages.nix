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
      pfetch
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
      # lxqt.lximage-qt
      rofi
      # pantheon.elementary-files
      brave
      firefox
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
      cinnamon.nemo
      imv
      mate.engrampa
      grim
      slurp
      wl-clipboard
      swappy
      wf-recorder
      mpv
      bluez
      pamixer
      # gtk3
      # gtk-layer-shell
      # waybar
      libnotify
    ];

    formatter = [ nixfmt shfmt stylua nodePackages.prettier ];

    works = [ slack vscodium zoom-us ];

  };
in
{
  home.packages =
    builtins.concatLists (builtins.map (x: groups."${x}") env.package_groups);
}
