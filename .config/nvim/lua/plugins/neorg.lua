return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>N", ":Neorg<CR>", desc = "Neorg open" },
		},
		config = function()
			require("neorg").setup({
				load = {
					-- Loads default behaviour
					["core.defaults"] = {},
					-- Adds pretty icons to your documents
					["core.concealer"] = {},
					["core.keybinds"] = {
						config = {
							default_keybinds = true,
						},
					},
					-- Manages Neorg workspaces
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/.config/notes",
								home = "~/.config/notes/home",
							},
							default_workspace = "home",
						},
					},
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
				},
			})
		end,
	},
}
