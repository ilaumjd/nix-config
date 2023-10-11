require("lspsaga").setup({
	-- keybinds for navigation in lspsaga window
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	-- use enter to open file with definition preview
	definition = {
		keys = {
			edit = "oo",
			split = "sh",
			vsplit = "sv",
			tabe = "tn",
		},
	},
	ui = {
		colors = {
			normal_bg = "#022746",
		},
	},
})
