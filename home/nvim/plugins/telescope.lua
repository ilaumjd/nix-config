local telescope = require("telescope")
local telescope_actions = require("telescope.actions")

telescope.setup({
	defaults = {
		path_display = { "truncate " },
		mappings = {
			i = {
				["<C-k>"] = telescope_actions.move_selection_previous, -- move to prev result
				["<C-j>"] = telescope_actions.move_selection_next, -- move to next result
			},
		},
	},
})
telescope.load_extension("fzf")

keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
