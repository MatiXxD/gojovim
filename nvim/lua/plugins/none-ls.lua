return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- LUA
        null_ls.builtins.formatting.stylua,
        -- RUBY
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.diagnostics.rubocop,
        -- PYTHON
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.djlint.with({
          args = { "-", "--reformat", "--indent", 2 },
        }),
        null_ls.builtins.diagnostics.djlint,
        -- HTML | CSS
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "css",
            "graphql",
            "html",
            "javascript",
            "javascriptreact",
            "json",
            "less",
            "markdown",
            "scss",
            "typescript",
            "typescriptreact",
            "yaml",
          },
        }),
        -- C++
        null_ls.builtins.formatting.clang_format.with({
          extra_args = { "--style=Google" },
        }),
        -- require("none-ls.diagnostics.cpplint"),
        -- GO
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports.reviser,
        null_ls.builtins.formatting.golines,
        -- null_ls.builtins.diagnostics.golangci_lint,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
