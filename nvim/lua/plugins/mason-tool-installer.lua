return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "black",
        "djlint",
        "clang-format",
        "cpplint",
        "gofumpt",
        "goimports",
        "golangci-lint",
        "isort",
        "prettier",
        "stylua",
      },

      auto_update = false,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 5,

      integrations = {
        ["mason-lspconfig"] = true,
        ["mason-null-ls"] = true,
        ["mason-nvim-dap"] = true,
      },
    })
  end,
}
