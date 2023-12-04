return {
	{
		"askfiy/visual_studio_code",
		priority = 100,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({
				options = {
					styles = {
						comments = "italic",
						functions = "bold",
						keywords = "bold",
						variables = "NONE",
						conditionals = "NONE",
						constants = "NONE",
						numbers = "NONE",
						operators = "NONE",
						strings = "NONE",
						types = "italic,bold",
					},
				},
			})
			vim.cmd("colorscheme github_dark_dimmed")
		end,
	},
}
