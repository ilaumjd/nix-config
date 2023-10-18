{

  # CMP
  nvim-cmp = {
    enable = true;
    mapping = {
      "<C-k>" = "cmp.mapping.select_prev_item()";
      "<C-j>" = "cmp.mapping.select_next_item()";
      "<C-b>" = "cmp.mapping.scroll_docs(-4)";
      "<C-f>" = "cmp.mapping.scroll_docs(4)";
      "<C-Space>" = "cmp.mapping.complete()";
      "<C-e>" = "cmp.mapping.abort()";
      "<CR>" = "cmp.mapping.confirm({ select = false })";
    };
    mappingPresets = [ "insert" ];
    snippet.expand.__raw = "function (args) require('luasnip').lsp_expand(args.body) end";
    sources = [
      { name = "nvim_lsp"; }
      { name = "luasnip"; }
      { name = "treesitter"; }
      { name = "path"; }
      { name = "buffer"; }
      { name = "rg"; }
      { name = "calc"; }
    ];
  };
  cmp-buffer.enable = true;
  cmp-calc.enable = true;
  cmp-path.enable = true;
  cmp-nvim-lsp.enable = true;
  cmp-rg.enable = true;
  cmp-treesitter.enable = true;
  cmp_luasnip.enable = true;

  # SNIPPET
  luasnip = {
    enable = true;
    fromVscode = [{ }];
  };

  # LSP
  lsp = {
    enable = true;
    servers = {
      # js/ts
      eslint.enable = true;
      tsserver.enable = true;
      tailwindcss.enable = true;
      # lua
      lua-ls.enable = true;
      # nix
      nil_ls.enable = true;
      rnix-lsp.enable = true;
    };
    keymaps = {
      lspBuf = {
        gD = "references";
        gi = "implementation";
        gt = "type_definition";
      };
    };
    postConfig = ''
      require("typescript").setup({
          disable_commands = false,
          debug = false,
          go_to_source_definition = {
              fallback = true,
          },
          server = __setup,
      })
    '';
  };
  lsp-format = {
    enable = true;
  };
  lspkind = {
    enable = true;
    cmp.enable = true;
  };
  lspsaga = {
    enable = true;
    definition.keys = {
      edit = "oo";
      split = "sh";
      vsplit = "sv";
      tabe = "tn";
    };
  };
  fidget.enable = true;

  # TREE SITTER
  treesitter.enable = true;
  ts-autotag.enable = true;
  ts-context-commentstring.enable = true;
  rainbow-delimiters.enable = true;
  nvim-autopairs = {
    enable = true;
    checkTs = true;
    tsConfig = {
      lua = [ "string" "source" ];
      javascript = [ "string" "template_string" ];
    };
  };

  # FILE EXPLORER
  neo-tree = {
    enable = true;
    addBlankLineAtTop = true;
    closeIfLastWindow = true;
    enableDiagnostics = true;
    enableGitStatus = true;
    window = {
      mappings = {
        "e".__raw = "function() vim.api.nvim_exec('Neotree filesystem', true) end";
        "b".__raw = "function() vim.api.nvim_exec('Neotree buffers', true) end";
        "g".__raw = "function() vim.api.nvim_exec('Neotree git_status', true) end";
        "h".__raw = "function() end";
      };
      width = 35;
    };
  };

  # TELESCOPE
  telescope = {
    enable = true;
    extensions = {
      frecency.enable = true;
      fzf-native.enable = true;
    };
    defaults = {
      mappings.i = {
        "<C-k>".__raw = "require('telescope.actions').move_selection_previous";
        "<C-j>".__raw = "require('telescope.actions').move_selection_next";
      };
    };
    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fr" = "oldfiles";
      "<leader>fg" = "live_grep";
      "<leader>fb" = "buffers";
      "<leader>fh" = "help_tags";
      "<leader>fk" = "keymaps";
      "<leader>fs" = "search_history";
    };
  };

  # GIT
  gitsigns.enable = true; # TODO: lazygit git conflicts

  # SESSION MANAGER
  # auto-session = {
  #   enable = true;
  #   autoSession = {
  #     enabled = true;
  #     enableLastSession = true;
  #   };
  #   autoSave.enabled = true;
  #   autoRestore.enabled = true;
  # };

  # USEFUL MOTIONS
  comment-nvim = {
    enable = true;
    mappings.extended = true;
  };
  surround.enable = true;

  # JUMPS
  flash.enable = true;
  leap.enable = true;
  navbuddy = {
    enable = true;
    lsp.autoAttach = true;
  };
  spider = {
    enable = true;
    keymaps.motions = {
      b = "b";
      e = "e";
      g = "ge";
      w = "w";
    };
  };
  vim-matchup = {
    enable = true;
    treesitterIntegration.enable = true;
  };

  # LINES
  bufferline = {
    enable = true;
    diagnostics = "nvim_lsp";
  };
  lualine = {
    enable = true;
    extensions = [ "fzf" ];
    globalstatus = true;
  };

  # VISUAL HELPERS
  notify.enable = true;
  nvim-colorizer.enable = true;
  nvim-lightbulb.enable = true;
  todo-comments.enable = true;

  # LEARNING HELPERS
  hardtime = {
    enable = true;
    resettingKeys = {
      h = [ "n" ];
      j = [ "n" ];
      k = [ "n" ];
      l = [ "n" ];
    };
  };

  # NIX
  hmts.enable = true;
  nix.enable = true;

  # OTHER TOOLS
  startify.enable = true;
  markdown-preview.enable = true;
  trouble.enable = true;
  which-key.enable = true;

}
