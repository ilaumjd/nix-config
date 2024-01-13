{ env, nixpkgs, home-manager, nixvim, nixneovimplugins, nixgl, gbar }:
let
  pkgs = import nixpkgs {
    system = "${env.system}";
    overlays = [ nixgl.overlay ];
  };
  nixGLWrap = import ./nixgl.nix pkgs;
in
home-manager.lib.homeManagerConfiguration {
  pkgs = pkgs;
  extraSpecialArgs = { inherit env; };
  modules = [
    ./.
    nixvim.homeManagerModules.nixvim
    gbar.homeManagerModules.x86_64-linux.default
    (import ../nix-settings.nix env nixneovimplugins)
    {
      nix.package = pkgs.nixVersions.unstable;
      fonts.fontconfig.enable = true;
      programs.wezterm.package = nixGLWrap pkgs.wezterm;
      programs.alacritty.package = nixGLWrap pkgs.alacritty;
      wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        extraConfig = builtins.readFile ./hyprland.conf;
        systemd = {
          enable = true;
          variables = [ "-all" ];
        };
        xwayland.enable = true;
      };
      programs.fuzzel.enable = true;
      programs.gBar = {
        enable = true;
        extraConfig = ''
          DrmAmdCard: card1
        '';
      };
      services.mako = {
        enable = true;
      };
      programs.wpaperd = {
        enable = true;
        settings = {
          default = {
            path = "~/wallpaper";
          };
        };
      };
      home.packages = with pkgs; [
        (nixGLWrap kitty)
        # lxqt.lximage-qt
        rofi
        # pantheon.elementary-files
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
        bluez
        pamixer
        # gtk3
        # gtk-layer-shell
        # waybar
        libnotify
        polkit
        libsForQt5.polkit-kde-agent
      ];
    }
  ];
}
