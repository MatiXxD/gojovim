return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"neocmake",
					"cssls",
					"emmet_ls",
					"golangci_lint_ls",
					"gopls",
					"html",
					"jdtls",
					"lua_ls",
					"pyright",
					"eslint",
					"rubocop",
					"ts_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})

			vim.lsp.config("neocmake", {
				capabilities = capabilities,
				filetypes = { "cmake", "txt" },
				root_dir = function(fname)
					return vim.loop.cwd()
				end,
			})

			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})

			vim.lsp.config("emmet_ls", {
				capabilities = capabilities,
			})

			vim.lsp.config("golangci_lint_ls", {
				capabilities = capabilities,
				root_dir = function(fname)
					return vim.loop.cwd()
				end,
			})

			vim.lsp.config("gopls", {
				capabilities = capabilities,
				root_dir = function(fname)
					return vim.loop.cwd()
				end,
			})

			vim.lsp.config("html", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
				end,
			})

			vim.lsp.config("jdtls", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			vim.lsp.config("pyright", {
				capabilities = capabilities,
				root_dir = function(fname)
					return vim.loop.cwd()
				end,
			})

			vim.lsp.config("eslint", {
				capabilities = capabilities,
				-- root_dir = function(fname)
				-- 	return vim.loop.cwd()
				-- end,
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})

			vim.lsp.config("rubocop", {
				capabilities = capabilities,
			})

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
				end,
			})

			vim.keymap.set("n", "<leader>qm", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
