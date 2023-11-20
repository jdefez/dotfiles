return {
	{
		"askfiy/visual_studio_code",
		priority = 100,
	},
	{
		"oxfist/night-owl.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[
	       colorscheme night-owl
	       highlight DiagnosticUnderlineError gui=undercurl
	       highlight DiagnosticUnderlineWarn gui=undercurl
      ]])
		end,
	},
}
