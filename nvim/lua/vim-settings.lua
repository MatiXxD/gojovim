vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- vim.cmd("set expandtab")
vim.g.mapleader = " "
vim.opt.relativenumber = true
vim.opt.number = true

function ToggleCurline()
	if vim.o.cursorline and vim.o.cursorcolumn then
		vim.o.cursorline = false
		vim.o.cursorcolumn = false
	else
		vim.o.cursorline = true
		vim.o.cursorcolumn = true
	end
end

vim.api.nvim_set_keymap("n", "<leader>cr", ":lua ToggleCurline()<CR>", { noremap = true, silent = true })
