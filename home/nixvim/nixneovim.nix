pkgs: {
  programs.nixneovim = {
    enable = true;
    colorschemes.gruvbox-baby.enable = true;
    defaultEditor = true;
    extraConfigLua = ''
      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/keymaps.lua}
      ${builtins.readFile ./nvim/plugins/lsp/conform.lua}
    '';
    plugins = {
      # lines
      bufferline.enable = true;

      lualine = {
        enable = true;
        extensions = [ "fzf" ];
        globalstatus = true;
      };
      incline.enable = true;

      lspconfig = {
        enable = true;
        servers = {
          nil.enable = true;
          rnix-lsp.enable = true;
        };
      };

      bufdelete.enable = true;
      colorizer.enable = true;
      comment.enable = true;
      comment-frame.enable = true;
      coq.enable = true;
      # dashboard.enable = true;
      diffview.enable = true;
      firenvim.enable = true;
      focus.enable = true;
      # ghosttext.enable = true;
      gitsigns.enable = true;
      goyo.enable = true;
      # hbac.enable = true;
      headlines.enable = true;
      indent-blankline.enable = true;
      intellitab.enable = true;
      luasnip.enable = true;
      markdown-preview.enable = true;
      notify.enable = true;
      nvim-autopairs.enable = true;
      # nvim-cmp.enable = true;
      nvim-jqx.enable = true;
      nvim-lightbulb.enable = true;
      plenary.enable = true;
      project-nvim.enable = true;
      scrollbar.enable = true;
      specs.enable = true;
      startify.enable = true;
      surround.enable = true;
      tagbar.enable = true;
      telescope.enable = true;
      todo-comments.enable = true;
      treesitter.enable = true;
      ts-context-commentstring.enable = true;
      undotree.enable = true;
      vim-printer.enable = true;
      which-key.enable = true;
      wilder.enable = true;
    };

    extraPlugins = with pkgs.vimExtraPlugins; [ conform-nvim ];
  };
}
