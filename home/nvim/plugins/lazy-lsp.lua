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

keymap("n", "<leader>fo", ":lua vim.lsp.buf.format()<CR>", opts)
keymap("n", "<leader>es", ":EslintFixAll<CR>", opts)
