return {
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "deep",
        toggle_style_key = "<leader>ts",
        toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
      })
      vim.cmd.colorscheme("onedark")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("github_dark")
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    name = "cyberdream",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("cyberdream")
    end,
  },
  {
    "sainnhe/sonokai",
    name = "sonokai",
    priority = 1000,
    config = function()
      local styles = { "default", "atlantis", "andromeda", "shusia", "maia", "espresso" }
      local cur_style = 0

      local toggle_style = function()
        cur_style = cur_style + 1
        if cur_style > #styles then
          cur_style = 0
        end

        vim.g.sonokai_style = styles[cur_style]
        vim.cmd("colorscheme sonokai")
        cur_style = cur_style + 1
      end

      vim.g.sonokai_enable_italic = true
      vim.cmd.colorscheme("sonokai")
      vim.keymap.set("n", "<leader>ta", toggle_style, {})
    end,
  },
  {
    "morhetz/gruvbox",
    name = "gruvbox",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "sainnhe/everforest",
    name = "everforest",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("everforest")
    end,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
      vim.cmd.colorscheme("tokyonight-storm")
      vim.cmd.colorscheme("tokyonight-day")
      vim.cmd.colorscheme("tokyonight-moon")
    end,
  },
  {
    "raphamorim/lucario",
    name = "lucario",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("lucario")
    end,
  },
  {
    "maxmx03/fluoromachine.nvim",
    name = "fluoromachine",
    priority = 1000,
    config = function()
      local fm = require("fluoromachine")
      fm.setup({
        glow = true,
        -- theme = "fluoromachine",
        theme = "retrowave",
        transparent = true,
      })
      vim.cmd.colorscheme("fluoromachine")
    end,
  },
}
