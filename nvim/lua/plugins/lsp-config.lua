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
          "tsserver",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.golangci_lint_ls.setup({
        capabilities = capabilities,
        root_dir = function(fname)
          return vim.loop.cwd()
        end,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
        root_dir = function(fname)
          return vim.loop.cwd()
        end,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
        end,
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        -- capabilities = capabilities,
        root_dir = function(fname)
          return vim.loop.cwd()
        end,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
      lspconfig.rubocop.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
