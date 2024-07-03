return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "golangci_lint_ls", "tsserver", "jdtls", "basedpyright", "cssls", "html"}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.golangci_lint_ls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.jdtls.setup({})
			lspconfig.basedpyright.setup({})
			lspconfig.cssls.setup({})
			lspconfig.html.setup({})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
		end
	}
}
