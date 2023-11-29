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
              -- neorg_leader = "<LocalLeader>",
            },
          },
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/.config/notes",
								test = "~/.config/notes/test",
							},
							default_workspace = "notes",
						},
					},
					-- Manages Neorg workspaces
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
