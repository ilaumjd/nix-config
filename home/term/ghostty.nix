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
      command = "${pkgs.zsh}/bin/zsh --login";
      theme = "rose-pine";
      font-family = "Zed Nerd Font Mono";
      font-size = 14;
      adjust-cell-height = "20%";
      shell-integration-features = "no-cursor,sudo,no-title";
      cursor-style = "block";
      cursor-style-blink = false;
      window-colorspace = "display-p3";
      window-save-state = "always";
      focus-follows-mouse = true;
      mouse-hide-while-typing = true;
      mouse-scroll-multiplier = 2;
      auto-update = "off";
      copy-on-select = "clipboard";
      macos-option-as-alt = true;
      macos-titlebar-style = "tabs";
      macos-window-shadow = true;
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
