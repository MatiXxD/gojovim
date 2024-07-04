return {
	"navarasu/onedark.nvim",
	name = "onedark",
	priority = 1000,
	config = function()
		local config = require("onedark")
		config.setup({
			style = "cool",
		})
		config.load()
	end,
}
