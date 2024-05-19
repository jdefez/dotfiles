return {
	{
		"gbprod/phpactor.nvim",
    ft = { "php" },
    lazy = true,
		build = function()
			-- To install/update phpactor when installing this plugin
			require("phpactor.handler.update")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("phpactor").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	-- {
	-- 	"phpactor/phpactor",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		vim.g.phpactorCompletionIgnoreCase = true
	-- 	end,
	-- 	keys = {
	-- 		{ "<leader>p", ":PhpactorContextMenu<CR>" },
	-- 		{ mode = "v", "<leader>pm", ":<C-U>PhpactorExtractMethod<CR>" },
	-- 		{ mode = "v", "<leader>pm", ":<C-U>PhpactorExtractExpression<CR>" },
	-- 	},
	-- },
}
