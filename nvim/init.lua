if vim.g.vscode then
	require("vim-settings")
else
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	end
	vim.opt.rtp:prepend(lazypath)
	require("vim-settings")
	-- require("lazy").setup("themes")
	require("lazy").setup("plugins")
	require("theme")
end
