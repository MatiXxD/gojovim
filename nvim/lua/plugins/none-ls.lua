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
        -- HTML | CSS
        null_ls.builtins.formatting.prettier,
        -- C++
        null_ls.builtins.formatting.clang_format,
        require("none-ls.diagnostics.cpplint"),
        -- GO
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.diagnostics.golangci_lint,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
