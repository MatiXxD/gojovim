if vim.g.vscode then
	require("vim-keymap-vscode")
else
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	end
	vim.opt.rtp:prepend(lazypath)
	require("vim-settings")
	-- require("lazy").setup("themes")
	require("lazy").setup({
		spec = {
			{ import = "plugins" },
		},
		rocks = {
			enabled = false,
			hererocks = false,
		},
	})
	require("theme")
end
