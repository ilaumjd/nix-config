local on_attach = function(client, bufnr)
	-- keybind options
	local _opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", _opts) -- show definition, references
	keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", _opts) -- got to declaration
	keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", _opts) -- see definition and make edits in window
	keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", _opts) -- go to implementation
	keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", _opts) -- see available code actions
	keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", _opts) -- smart rename
	keymap("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", _opts) -- show  diagnostics for line
	keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", _opts) -- show diagnostics for cursor
	keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", _opts) -- jump to previous diagnostic in buffer
	keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", _opts) -- jump to next diagnostic in buffer
	keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", _opts) -- show documentation for what is under cursor
	keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", _opts) -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lazy-lsp").setup({
	excluded_servers = {
		"denols",
		"sqls",
		"rome",
	},
	default_config = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
})
