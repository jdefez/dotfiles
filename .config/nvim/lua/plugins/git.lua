return {
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
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
