return {
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		"luckasRanarison/clear-action.nvim",
		opts = {
			mappings = {
				code_action = { "<leader>a", "display code action" },
			},
		},
	},
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = {
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {
			keymaps = {
				show_help = "?",
				close = { "<Esc>", "q" },
				goto_location = "<Cr>",
				peek_location = "o",
				goto_and_close = "<S-Cr>",
				restore_location = "<C-g>",
				hover_symbol = "<C-space>",
				toggle_preview = "P",
				rename_symbol = "r",
				code_actions = "a",
				fold = "h",
				unfold = "l",
				fold_toggle = "<Tab>",
				fold_toggle_all = "<S-Tab>",
				fold_all = "W",
				unfold_all = "E",
				fold_reset = "R",
				down_and_jump = "<C-j>",
				up_and_jump = "<C-k>",
			},
		},
	},
	{
		"dnlhc/glance.nvim",
		config = true,
		lazy = true,
		cmd = "Glance",
		keys = {
			{ "gD", "<CMD>Glance definitions<CR>" },
			{ "gR", "<CMD>Glance references<CR>" },
			{ "gY", "<CMD>Glance type_definitions<CR>" },
			{ "gM", "<CMD>Glance implementations<CR>" },
		},
	},
	{
		"stevearc/conform.nvim",
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>lf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				rust = { "ast_grep" },
				lua = { "stylua" },
				php = { "pint" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		name = "lint",
		lazy = true,
		event = "BufWritePost",
		config = function()
			require("lint").linters_by_ft = {
				php = "phpstan",
			}
		end,
		init = function()
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		opts = {},
		keys = {
			{
				"zR",
				function()
					return require("ufo").openAllFolds()
				end,
				desc = "Open folds",
			},
			{
				"zM",
				function()
					return require("ufo").closeAllFolds()
				end,
				desc = "Close folds",
			},
		},
	},
}
