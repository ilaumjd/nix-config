config: {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    enableFishIntegration = true;
    installBatSyntax = false;
    # installVimSyntax = true;
    settings = {
      command = "/etc/profiles/per-user/" + config.home.username + "/bin/zsh --login";
      theme = "nord";
      # font-family = "SauceCodePro Nerd Font Mono";
      font-size = 14;
      adjust-cell-height = "30%";
      shell-integration-features = "no-cursor,sudo,no-title";
      cursor-style = "block";
      cursor-style-blink = false;
      window-padding-x = 4;
      window-padding-balance = true;
      window-colorspace = "display-p3";
      window-save-state = "always";
      focus-follows-mouse = true;
      mouse-hide-while-typing = true;
      mouse-scroll-multiplier = 2;
      auto-update = "off";
      copy-on-select = "clipboard";
      macos-titlebar-style = "tabs";
      macos-window-shadow = false;
      keybind = [
        "cmd+s>r=reload_config"
        "cmd+s>w=close_surface"
        "cmd+s>n=new_window"
        "cmd+s>t=new_tab"
        "cmd+s>shift+l=next_tab"
        "cmd+s>shift+h=previous_tab"
        "cmd+s>comma=move_tab:-1"
        "cmd+s>period=move_tab:1"
        "cmd+s>1=goto_tab:1"
        "cmd+s>2=goto_tab:2"
        "cmd+s>3=goto_tab:3"
        "cmd+s>4=goto_tab:4"
        "cmd+s>5=goto_tab:5"
        "cmd+s>6=goto_tab:6"
        "cmd+s>7=goto_tab:7"
        "cmd+s>8=goto_tab:8"
        "cmd+s>9=goto_tab:9"
        "cmd+s>0=goto_tab:10"
        "cmd+s>\\=new_split:right"
        "cmd+s>-=new_split:down"
        "cmd+s>j=goto_split:bottom"
        "cmd+s>k=goto_split:top"
        "cmd+s>h=goto_split:left"
        "cmd+s>l=goto_split:right"
        "cmd+s>z=toggle_split_zoom"
        "cmd+s>e=equalize_splits"
      ];
    };
  };
}
