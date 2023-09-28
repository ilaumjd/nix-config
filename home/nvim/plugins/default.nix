pkgs:

with pkgs.vimPlugins; [


  ###### USEFUL COMMANDS ######
  {
    plugin = comment-nvim;
    type = "lua";
    config = "require('Comment').setup()";
  }
  {
    plugin = nvim-surround;
    type = "lua";
    config = "require('nvim-surround').setup()";
  }
  vim-ReplaceWithRegister


  ###### TREESITTER ######
  {
    plugin = nvim-treesitter.withAllGrammars;
    type = "lua";
    config = builtins.readFile ./treesitter.lua;
  }
  nvim-ts-autotag
  twilight-nvim


  ###### COMPLETION ######
  {
    plugin = nvim-cmp;
    type = "lua";
    config = builtins.readFile ./nvim-cmp.lua;
  }
  cmp-buffer
  cmp-path
  cmp-cmdline


  ###### SNIPPET ######
  cmp_luasnip
  friendly-snippets
  luasnip


  ###### LSP ######
  {
    plugin = lazy-lsp-nvim;
    type = "lua";
    config = ''
      ${builtins.readFile ./lsp/lazy-lsp.lua}
      ${builtins.readFile ./lsp/lspsaga.lua}
      ${builtins.readFile ./lsp/null-ls.lua}
    '';
  }
  cmp-nvim-lsp
  null-ls-nvim 
  lspkind-nvim
  lspsaga-nvim


  ###### FILE EXPLORER ######
  {
    plugin = neo-tree-nvim;
    type = "lua";
    config = builtins.readFile ./neo-tree.lua;
  }


  ###### FUZZY FINDER ######
  {
    plugin = telescope-nvim;
    type = "lua";
    config = builtins.readFile ./telescope.lua;
  }
  telescope-fzf-native-nvim


  ###### DASHBOARD ######
  {
    plugin = dashboard-nvim;
    type = "lua";
    config = "require('dashboard').setup()";
  }


  ###### LINES ######
  {
    plugin = lualine-nvim;
    type = "lua";
    config = builtins.readFile ./lualine.lua;
  }
  {
    plugin = tabby-nvim;
    type = "lua";
    config = builtins.readFile ./tabby.lua;
  }


  ###### THEMES ######
  {
    plugin = sonokai;
    config = "colorscheme sonokai";
  }
  nvim-web-devicons

]
