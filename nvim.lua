local opt = vim.opt
local cmd = vim.cmd

-- line numbers
opt.number = true
opt.relativenumber = true

-- cursor line
opt.cursorline = true

-- tab & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- search 
opt.ignorecase = true
opt.smartcase = true

-- line wrapping
opt.wrap = false

-- scrolling
opt.scrolloff = 5

-- colors
opt.termguicolors = true
cmd[[colorscheme sonokai]]
--opt.signcolumn = "yes"

-- clipboard
opt.clipboard:append("unnamedplus")

