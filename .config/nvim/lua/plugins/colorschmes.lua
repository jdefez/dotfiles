return {
	{
		"askfiy/visual_studio_code",
		priority = 100,
	},
	{
		"oxfist/night-owl.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[
	       colorscheme night-owl
	       highlight DiagnosticUnderlineError gui=undercurl
	       highlight DiagnosticUnderlineWarn gui=undercurl
	     ]])
		end,
	},
}
