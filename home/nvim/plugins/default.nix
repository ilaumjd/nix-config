pkgs:

with pkgs.vimPlugins; [

  ###### USEFUL COMMANDS #####
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
  vim-tmux-navigator


  ###### LSP #####
  {
    plugin = lazy-lsp-nvim;
    type = "lua";
    config = builtins.readFile ./lazy-lsp.lua;
  }


  ###### FILE EXPLORER #####
  {
    plugin = nvim-tree-lua;
    type = "lua";
    config = builtins.readFile ./nvim-tree.lua;
  }
  nvim-web-devicons


  ###### FUZZY FINDER #####
  {
    plugin = telescope-nvim;
    type = "lua";
    config = builtins.readFile ./telescope.lua;
  }
  telescope-fzf-native-nvim


  ###### COMPLETION #####
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


  ###### THEMES #####
  {
    plugin = lualine-nvim;
    type = "lua";
    config = builtins.readFile ./theme.lua;
  }
  {
    plugin = sonokai;
    config = "colorscheme sonokai";
  }

]
