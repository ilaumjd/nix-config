pkgs: {
  programs.nixvim = {

    enable = true;
    colorschemes.gruvbox.enable = true;

    keymaps = import ./keymaps.nix;
    plugins = import ./plugins.nix;

    extraConfigLuaPre = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymaps.lua}
    '';

    extraPlugins = with pkgs; [
      vimPlugins.vim-ReplaceWithRegister
   ];

  };
}
