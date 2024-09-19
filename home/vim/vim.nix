pkgs: {
  programs.vim = {
    packageConfigurable = if pkgs.stdenv.isDarwin then pkgs.vim-darwin else pkgs.vim-full;
    enable = true;
    plugins = with pkgs.vimPlugins; [
      auto-pairs
      ctrlp-vim
      nord-vim
      vim-airline
      vim-commentary
      vim-gitgutter
      vim-nix
      vim-subversive
    ];
    extraConfig = builtins.readFile ./vimrc;
  };
}
