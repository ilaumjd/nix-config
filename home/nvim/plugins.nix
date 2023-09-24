pkgs:

with pkgs.vimPlugins; [
  vim-tmux-navigator
  vim-ReplaceWithRegister
  nvim-web-devicons


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


  ###### LSP #####
  {
    plugin = lazy-lsp-nvim;
    type = "lua";
    config = ''
      require('lazy-lsp').setup {
        excluded_servers = {
          'sqls',
        },
        preferred_servers = {
          javascript = "eslint",
          javascriptreact = "eslint",
          typescript = "eslint",
          typescriptreact = "eslint",
          html = "tailwindcss",
          nix = "rnix",
        },
      }
    '';
  }


  ###### FILE EXPLORER #####
  {
    plugin = nvim-tree-lua;
    type = "lua";
    config = ''
      require('nvim-tree').setup()
      vim.g.loaded = 1
      vim.g.loaded_netrwPlugin = 1
    '';
  }


  ###### FUZZY FINDER #####
  {
    plugin = telescope-nvim;
    type = "lua";
    config = ''
      local telescope = require('telescope')
      telescope.setup()
    '';
  }
  {
    plugin = telescope-fzf-native-nvim;
    type = "lua";
    config = "telescope.load_extension('fzf')";
  }


  ###### THEMES #####
  {
    plugin = sonokai;
    config = "colorscheme sonokai";
  }
  {
    plugin = lualine-nvim;
    type = "lua";
    config = ''
      local theme = require('lualine.themes.base16')
      require('lualine').setup {
        options = { theme = theme },
      }
    '';
  }
]
