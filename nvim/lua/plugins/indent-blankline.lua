return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup({
			scope = {
				show_start = false,
				show_end = false,
			},
		})
	end,
}
