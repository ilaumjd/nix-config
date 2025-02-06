pkgs:
let
  mod = if pkgs.stdenv.isDarwin then "cmd" else "alt";
in
{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    enableFishIntegration = true;
    installBatSyntax = false;
    # installVimSyntax = true;
    settings = {
      auto-update = "off";
      command = "${pkgs.zsh}/bin/zsh --login";
      copy-on-select = false;
      # ui
      theme = "rose-pine";
      font-family = "IntoneMono Nerd Font";
      font-size = 14;
      adjust-cell-height = "20%";
      background-opacity = if pkgs.stdenv.isDarwin then 1.0 else 0.8;
      cursor-style = "block";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor,sudo,no-title";
      window-colorspace = "display-p3";
      window-decoration = true;
      window-save-state = "always";
      # mouse
      focus-follows-mouse = true;
      mouse-hide-while-typing = true;
      mouse-scroll-multiplier = 2;
      # macos
      macos-option-as-alt = true;
      macos-titlebar-style = "tabs";
      macos-window-shadow = true;
      # gtk
      gtk-titlebar = false;
      keybind = [
        "${mod}+s>r=reload_config"
        "${mod}+s>w=close_surface"
        "${mod}+s>n=new_window"
        "${mod}+s>t=new_tab"
        "${mod}+s>shift+l=next_tab"
        "${mod}+s>shift+h=previous_tab"
        "${mod}+s>comma=move_tab:-1"
        "${mod}+s>period=move_tab:1"
        "${mod}+s>1=goto_tab:1"
        "${mod}+s>2=goto_tab:2"
        "${mod}+s>3=goto_tab:3"
        "${mod}+s>4=goto_tab:4"
        "${mod}+s>5=goto_tab:5"
        "${mod}+s>6=goto_tab:6"
        "${mod}+s>7=goto_tab:7"
        "${mod}+s>8=goto_tab:8"
        "${mod}+s>9=goto_tab:9"
        "${mod}+s>0=goto_tab:10"
        "${mod}+s>\\=new_split:right"
        "${mod}+s>-=new_split:down"
        "${mod}+s>j=goto_split:bottom"
        "${mod}+s>k=goto_split:top"
        "${mod}+s>h=goto_split:left"
        "${mod}+s>l=goto_split:right"
        "${mod}+s>z=toggle_split_zoom"
        "${mod}+s>e=equalize_splits"
      ];
    };
  };
}
