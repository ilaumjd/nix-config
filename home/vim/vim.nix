pkgs: {
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      ctrlp-vim
      nord-vim
      vim-airline
      vim-commentary
      vim-gitgutter
      vim-nix
      ReplaceWithRegister
    ];
    extraConfig = builtins.readFile ./vimrc;
  };
}
