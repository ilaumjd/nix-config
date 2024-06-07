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
      vimPlugins.typescript-nvim
      # {
      #   plugin = vimUtils.buildVimPlugin {
      #     name = "nvim-lsp-file-operations";
      #     src = pkgs.fetchFromGitHub {
      #       owner = "antosha417";
      #       repo = "nvim-lsp-file-operations";
      #       rev = "master";
      #       hash = "sha256-EjjHOZI9aHd8uefQXfcJGKCJMB3xy5HeTh9jFpBKOEo=";
      #     };
      #   };
      # }
    ];

    # extraConfigLuaPost = ''
    #   require('lsp-file-operations').setup()
    # '';

  };
}
