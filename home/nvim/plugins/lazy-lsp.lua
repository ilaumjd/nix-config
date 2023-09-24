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
