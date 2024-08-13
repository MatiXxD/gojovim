return {
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    config = function()
      require("onedark").setup({
        style = "cool",
        toggle_style_key = "<leader>ts",
        toggle_style_list = { "deep", "cool" },
      })
      vim.cmd.colorscheme("onedark")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
