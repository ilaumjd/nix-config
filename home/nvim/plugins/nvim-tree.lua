require('nvim-tree').setup {
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
}

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
