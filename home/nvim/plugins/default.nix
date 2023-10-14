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
    config = ''
      ${builtins.readFile ./nvim-cmp.lua}
      ${builtins.readFile ./nvim-autopairs.lua}
    '';
  }
  cmp-buffer
  cmp-path
  cmp-cmdline
  nvim-autopairs

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
      ${builtins.readFile ./lsp/conform.lua}
    '';
  }
  cmp-nvim-lsp
  lspkind-nvim
  lspsaga-nvim
  {
    plugin = pkgs.vimUtils.buildVimPlugin {
      name = "conform-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "stevearc";
        repo = "conform.nvim";
        rev = "v3.10.0";
        hash = "sha256-aMVJr4yY+4VbQ7R7u+6RB3vUJrQf5Ocrs52ILBottAg=";
      };
    };
  }

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

  ###### GIT ######
  {
    plugin = gitsigns-nvim;
    type = "lua";
    config = ''
      ${builtins.readFile ./git/gitsigns.lua}
      ${builtins.readFile ./git/git-conflict.lua}
      ${builtins.readFile ./git/lazygit.lua}
    '';
  }
  git-conflict-nvim
  lazygit-nvim

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

  ###### OTHERS #######
  {
    plugin = pkgs.vimUtils.buildVimPlugin {
      name = "nvim-lsp-file-operations";
      src = pkgs.fetchFromGitHub {
        owner = "antosha417";
        repo = "nvim-lsp-file-operations";
        rev = "master";
        hash = "sha256-EjjHOZI9aHd8uefQXfcJGKCJMB3xy5HeTh9jFpBKOEo=";
      };
    };
    type = "lua";
    config = "require('lsp-file-operations').setup()";
  }
]
