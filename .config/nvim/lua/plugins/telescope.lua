return {
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
}
