return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				indent = {
					enable = true,
				},
				-- A list of parser names, or "all"
				ensure_installed = {
					"markdown",
					"graphql",
					"phpdoc",
					"python",
					"regex",
					"json",
					"html",
					"yaml",
					"vue",
					"css",
					"lua",
					"php",
				},
				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,
				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,
				-- List of parsers to ignore installing (for "all")
				ignore_install = {},
				highlight = {
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		"luckasRanarison/clear-action.nvim",
		opts = {
			mappings = {
				code_action = { "<leader>a", "apply code action" },
				quickfix = { "<leader>q", "apply quickfix" },
				quickfix_next = { "]a", "apply next quickfix" },
				quickfix_prev = { "[a", "apply prev quickfix" },
				-- Consider this as a Hydra or prefixed with a 'refactor' mapping.
				refactor = { "<leader>rr", "apply refactor" },
				refactor_inline = { "<leader>ri", "refactor inline" },
				refactor_extract = { "<leader>re", "refactor extract" },
				refactor_rewrite = { "<leader>rw", "refactor rewrite" },
				-- actions = {
				--     ["rust_analyzer"] = {
				--         -- ["Inline"] = "<leader>ai"
				--         ["Add braces"] = { "<leader>rb", "Add braces" },
				--         ["Insert explicit type"] = { "<leader>rt", "Explicit type" },
				--     },
				-- },
			},
		},
	},
	{
		"simrat39/symbols-outline.nvim",
		opts = {},
		keys = {
			{ "<leader>o", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
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
				json = { "prettier" },
				lua = { "stylua" },
				php = { "pint" },
				xml = { "xmlformatter" },
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
	-- {
	-- 	"hinell/lsp-timeout.nvim",
	-- 	dependencies = { "neovim/nvim-lspconfig" },
	-- },
}
