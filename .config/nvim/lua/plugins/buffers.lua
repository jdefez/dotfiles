return {
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		-- tag = "v3.*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				themable = true,
				-- separator_style = 'slant'
			},
		},
		keys = {
			{ "bL", "<cmd>:BufferLineMoveNext<CR>", desc = "Move buffer right" },
			{ "bH", "<cmd>:BufferLineMovePrev<CR>", desc = "Move buffer left" },
			{ "bl", "<cmd>:BufferLineCycleNext<CR>", desc = "Next buffer" },
			{ "bh", "<cmd>:BufferLineCyclePrev<CR>", desc = "Previous buffer" },
			{ "bp", "<cmd>:BufferLinePick<CR>", desc = "Pick buffer" },
			{ "bP", "<cmd>:BufferLineTogglePin<CR>", desc = "Pin/Unpin buffer" },
			{ "bs", "<cmd>:BufferLineSortByDirectory<CR>", desc = "Sort buffer by directory" },
			{ "bch", "<cmd>:BufferLineCloseLeft<CR>", desc = "Close left buffers" },
			{ "bcl", "<cmd>:BufferLineCloseRight<CR>", desc = "Next right buffers" },
		},
	},
	{
		"kazhala/close-buffers.nvim",
		config = true,
		keys = {
			-- buffer delete
			{
				"<leader>bz",
				function()
					require("close_buffers").delete({ type = "hidden", force = true })
				end,
				"Delete all non-visible buffers",
			},
			{
				"<leader>bu",
				function()
					require("close_buffers").delete({ type = "nameless" })
				end,
				"Delete all buffers without name",
			},
			{
				"<leader>bc",
				function()
					require("close_buffers").delete({ type = "this" })
				end,
				"Delete the current buffer",
			},

			-- buffer wipeout
			{
				"<leader>ba",
				function()
					require("close_buffers").wipe({ type = "all", force = true })
				end,
				"Wipe all buffers",
			},
			{
				"<leader>bo",
				function()
					require("close_buffers").wipe({ type = "other", force = true })
				end,
				"Wipe all buffers except the current focused",
			},
		},
	},
	{
		"LintaoAmons/scratch.nvim",
		event = "VimEnter",
		keys = {
			{
				"<leader>ss",
				function()
					require("scratch").scratch()
				end,
				"Scratch",
			},
			{
				"<leader>so",
				function()
					require("scratch").openScratch()
				end,
				"Open scratch",
			},
		},
	},
}
