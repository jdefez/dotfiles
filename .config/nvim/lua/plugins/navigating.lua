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
    },
	},
	{
		"yamatsum/nvim-cursorline",
		config = {
			cursorline = {
				enable = true,
				timeout = 500,
				number = false,
			},
			cursorword = {
				enable = true,
				min_length = 3,
				hl = { underline = true },
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
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>fr",
				function()
					require("fzf-lua").resume()
				end,
				desc = "fzf resume",
			},
			{
				"<leader>fh",
				function()
					require("fzf-lua").help_tags()
				end,
				desc = "Show help tags",
			},
			{
				"<leader>fb",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "Show buffers",
			},
			{
				"<leader>ff",
				function()
					require("fzf-lua").files()
				end,
				desc = "Show files",
			},
			{
				"<leader>fl",
				function()
					require("fzf-lua").blines()
				end,
				desc = "Current buffer lines",
			},
			{
				"<leader>fg",
				function()
					require("fzf-lua").grep()
				end,
				desc = "live grep",
			},
			{
				"<leader>fG",
				function()
					require("fzf-lua").grep_cword()
				end,
				desc = "grep current word",
			},
			{
				"<leader>fc",
				function()
					require("fzf-lua").builtin()
				end,
				desc = "fzf builtin commands",
			},
		},
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},
	{
		"folke/zen-mode.nvim",
		keys = {
			{ "<leader>z", "<cmd>ZenMode<CR>", desc = "Zen mode" },
		},
		opts = {
			window = {
				backdrop = 1,
			},
		},
	},
}
