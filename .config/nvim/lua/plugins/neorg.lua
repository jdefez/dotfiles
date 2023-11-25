return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					-- Loads default behaviour
					["core.defaults"] = {},
					-- Adds pretty icons to your documents
					["core.concealer"] = {},
					-- Manages Neorg workspaces
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/.config/notes",
							},
						},
					},
				},
			})
		end,
	},
}
