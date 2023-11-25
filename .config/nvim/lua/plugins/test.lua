return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			-- "olimorris/neotest-phpunit",
			"theutz/neotest-pest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					-- require("neotest-phpunit"),
					require("neotest-pest"),
				},
			})
		end,
		keys = {
			{
				"<leader>tn",
				function()
					require("neotest").run.run()
				end,
				desc = "Run nearest test",
			},
			{
				"<leader>tx",
				function()
					require("neotest").run.stop()
				end,
				desc = "Stop nearest test",
			},
			{
				"<leader>ta",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run all tests",
			},
			{
				"<leader>tl",
				function()
					require("neotest").run.run_last()
				end,
				desc = "Run last test",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle summary",
			},
			{
				"<leader>to",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Toggle output panel",
			},
		},
	},
}
