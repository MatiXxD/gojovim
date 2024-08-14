return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")
			local pickers = require("telescope.pickers")
			local finders = require("telescope.finders")
			local sorters = require("telescope.sorters")
			local themes = require("telescope.themes")

			local function save_colorsceme(colorscheme)
				local file = io.open(vim.fn.stdpath("config") .. "/lua/theme.lua", "w")
				if file then
					file:write('vim.cmd.colorscheme("' .. colorscheme .. '")\n')
					file:close()
				end
          print("Error: Couldn't open theme file")
			end

			local function set_colorscheme(prompt_bufnr)
				local selected = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd("colorscheme " .. selected[1])
        save_colorsceme(selected[1])
			end

			local function next_colorscheme(prompt_bufnr)
				actions.move_selection_next(prompt_bufnr)
				local selected = action_state.get_selected_entry()
				vim.cmd("colorscheme " .. selected[1])
        save_colorsceme(selected[1])
			end

			local function prev_colorscheme(prompt_bufnr)
				actions.move_selection_previous(prompt_bufnr)
				local selected = action_state.get_selected_entry()
				vim.cmd("colorscheme " .. selected[1])
        save_colorsceme(selected[1])
			end

			local colors = vim.fn.getcompletion("", "color")
			local opts = themes.get_dropdown({
				finder = finders.new_table(colors),
				sorter = sorters.get_generic_fuzzy_sorter({}),
				attach_mappings = function(_, map)
					map("i", "<CR>", set_colorscheme)
					map("i", "<C-n>", next_colorscheme)
					map("i", "<C-p>", prev_colorscheme)
					map("n", "<CR>", set_colorscheme)
					map("n", "<C-n>", next_colorscheme)
					map("n", "<C-p>", prev_colorscheme)
					return true
				end,
			})

			local pick_colorscheme = function()
				pickers.new(opts):find()
			end

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>cs", pick_colorscheme, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
