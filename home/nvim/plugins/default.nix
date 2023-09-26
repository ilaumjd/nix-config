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


  ###### DASHBOARD ######
  {
    plugin = dashboard-nvim;
    type = "lua";
    config = "require('dashboard').setup()";
  }


  ###### TREESITTER ######
  {
    plugin = nvim-treesitter.withAllGrammars;
    type = "lua";
    config = builtins.readFile ./treesitter.lua;
  }
  nvim-treesitter-context
  nvim-treesitter-refactor
  nvim-ts-autotag
  twilight-nvim


  ###### LSP ######
  {
    plugin = lazy-lsp-nvim;
    type = "lua";
    config = builtins.readFile ./lazy-lsp.lua;
  }


  ###### COMPLETION ######
  {
    plugin = nvim-cmp;
    type = "lua";
    config = builtins.readFile ./nvim-cmp.lua;
  }
  cmp-buffer
  cmp-path
  cmp-cmdline
  cmp_luasnip
  luasnip
  friendly-snippets


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


  ###### LINES ######
  {
    plugin = lualine-nvim;
    type = "lua";
    config = builtins.readFile ./theme.lua;
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
