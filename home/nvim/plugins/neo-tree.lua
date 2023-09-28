require("neo-tree").setup({
	window = {
		mappings = {
			["e"] = function()
				vim.api.nvim_exec("Neotree filesystem", true)
			end,
			["b"] = function()
				vim.api.nvim_exec("Neotree buffers", true)
			end,
			["g"] = function()
				vim.api.nvim_exec("Neotree git_status", true)
			end,
			["h"] = function() end,
		},
		width = 30,
	},
})

keymap("n", "<leader>ee", ":Neotree toggle reveal<CR>", opts)
