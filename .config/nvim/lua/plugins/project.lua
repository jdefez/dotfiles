return {
	"coffebar/neovim-project",
	lazy = false,
	priority = 100,
	opts = {
		projects = { -- define project roots
			"~/Code/*",
			"~/.config/nvim",
			"~/.config/kitty",
			"~/.config/notes",
		},
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
		{ "Shatur/neovim-session-manager" },
	},
	keys = {
		{ "<leader>P", "<cmd>Telescope neovim-project discover<CR>", desc = "Projects list" },
	},
}
