{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    flags = [ "--disable-up-arrow" ];
    settings = {
      enter_accept = true;
      keymap_mode = "vim-normal";
      sync.records = true;
    };
  };
}
