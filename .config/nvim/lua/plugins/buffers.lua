return {
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
			{ "bl", "<cmd>:BufferLineMoveNext<CR>", desc = "Move buffer right" },
			{ "bs", "<cmd>:BufferLineSortByDirectory<CR>", desc = "Sort buffers by directory" },
			{ "bh", "<cmd>:BufferLineMovePrev<CR>", desc = "Move buffer left" },
			{ "bp", "<cmd>:BufferLinePick<CR>", desc = "Pick buffer" },
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
}
