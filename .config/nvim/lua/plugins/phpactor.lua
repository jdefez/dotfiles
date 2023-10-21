return {
	"phpactor/phpactor",
	event = "VeryLazy",
	config = function()
		vim.g.phpactorCompletionIgnoreCase = true
	end,
	keys = {
		{ "<leader>p", ":PhpactorContextMenu<CR>" },
		{ mode = "v", "<leader>pm", ":<C-U>PhpactorExtractMethod<CR>" },
		{ mode = "v", "<leader>pm", ":<C-U>PhpactorExtractExpression<CR>" },
	},
}
