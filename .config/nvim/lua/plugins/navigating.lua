return {
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			label = {
				rainbow = {
					enable = true,
				},
			},
			highlight = {
				backdrop = true,
			},
		},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
	},
	{
		"nyngwang/murmur.lua",
		opts = {
			cursor_rgb = {
				guibg = nil,
				guifg = "#B17855",
			},
			-- cursor_rgb_always_use_config = true,
			max_len = 80,
			min_len = 3,
			exclude_filetypes = {},
			callbacks = {
				-- to trigger the close_events of vim.diagnostic.open_float.
				function()
					-- Close floating diag. and make it triggerable again.
					vim.cmd("doautocmd InsertEnter")
					vim.w.diag_shown = false
				end,
			},
		},
	},
	{
		"karb94/neoscroll.nvim",
		opts = {},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			enable_git_status = false,
			enable_diagnostics = false,
			window = {
				position = "right",
			},
		},
		keys = {
			{ "<leader>n", ":Neotree toggle<cr>" },
		},
	},
	{
		"mrjones2014/smart-splits.nvim",
		lazy = false,
		opts = {},
		enabled = true,
		keys = {
			-- resizing splits
			{
				"<A-h>",
				function()
					return require("smart-splits").resize_left()
				end,
				desc = "Split resize left",
			},
			{
				"<A-j>",
				function()
					return require("smart-splits").resize_down()
				end,
				desc = "Split resize down",
			},
			{
				"<A-k>",
				function()
					return require("smart-splits").resize_up()
				end,
				desc = "Split resize up",
			},
			{
				"<A-l>",
				function()
					return require("smart-splits").resize_right()
				end,
				desc = "Split resize right",
			},
			-- moving between splits
			{
				"<C-h>",
				function()
					return require("smart-splits").move_cursor_left()
				end,
				desc = "Split jump left",
			},
			{
				"<C-j>",
				function()
					return require("smart-splits").move_cursor_down()
				end,
				desc = "Split jump down",
			},
			{
				"<C-k>",
				function()
					return require("smart-splits").move_cursor_up()
				end,
				desc = "Split jump up",
			},
			{
				"<C-l>",
				function()
					return require("smart-splits").move_cursor_right()
				end,
				desc = "Split jump right",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		opts = {
			defaults = {
				-- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
				layout_strategy = "vertical",
				layout_config = { height = 0.95 },
			},
		},
		keys = {
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Show buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Show help tags" },
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find file" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Grep" },
			{ "<leader>fG", "<cmd>Telescope grep_string<CR>", desc = "Grep word" },
			{ "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find in buffer" },
		},
	},
}
