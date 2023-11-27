{ env, nixpkgs, home-manager, nixvim, nixneovimplugins, nixgl }:
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
    (import ../nix-settings.nix env nixneovimplugins)
    {
      nix.package = pkgs.nixVersions.unstable;
      fonts.fontconfig.enable = true;
      programs.wezterm.package = nixGLWrap pkgs.wezterm;
      programs.alacritty.package = nixGLWrap pkgs.alacritty;
      wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        extraConfig = builtins.readFile ../hyprland.conf;
      };
      programs.fuzzel.enable = true;
      xsession.windowManager.i3 = {
        enable = true;
        config = {

          keybindings =
            let
              modifier = "Mod1";
            in
            nixpkgs.lib.mkOptionDefault {
              "${modifier}+Return" = "exec wezterm";
              "${modifier}+Shift+q" = "kill";
              "${modifier}+space" = "exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -sidebar-mode -columns 3 -font 'Noto Sans 14'";
              "${modifier}+h" = "focus left";
              "${modifier}+j" = "focus down";
              "${modifier}+k" = "focus up";
              "${modifier}+l" = "focus right";
              "${modifier}+Shift+h" = "move left";
              "${modifier}+Shift+j" = "move down";
              "${modifier}+Shift+k" = "move up";
              "${modifier}+Shift+l" = "move right";
              "${modifier}+semicolon" = "split h";
              "${modifier}+dot" = "split v";
            };

          gaps = {
            inner = 10;
            outer = 20;
          };
          menu = "rofi -show run";
          terminal = "wezterm";
          window = {
            border = 5;
            titlebar = false;
          };
          workspaceAutoBackAndForth = true;
          colors = {
            background = "#ffff00";
          };
        };
      };
    }
  ];
}
