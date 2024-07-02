return {
	"nvim-treesdditter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "go", "cpp", "css", "bash", "cmake", "cuda", "java" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
