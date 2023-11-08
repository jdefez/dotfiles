return {
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = {
			default_mappings = true, -- disable buffer local mapping created by this plugin
			default_commands = true, -- disable commands created by this plugin
			disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
			list_opener = "copen", -- command or function to open the conflicts list
			highlights = { -- They must have background color, otherwise the default color will be used
				incoming = "DiffAdd",
				current = "DiffText",
			},
		},
		keys = {
			-- Default mappings
			-- co — choose ours
			-- ct — choose theirs
			-- cb — choose both
			-- c0 — choose none
			-- ]x — move to previous conflict
			-- [x — move to next conflict
			{ "<leader>C", "<cmd>:GitConflictListQf<cr>", "Show conflicts list" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"NeogitOrg/neogit",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>G", "<cmd>Neogit kind=vsplit<CR>", desc = "Neogit open" },
		},
	},
}
