local null_ls = require("null-ls")

return {
	"jose-elias-alvarez/null-ls.nvim",
	opts = {
		sources = {
			-- code actions

			null_ls.builtins.code_actions.gitsigns,

			-- completion

			null_ls.builtins.completion.vsnip,

			-- diagnostics

			null_ls.builtins.diagnostics.phpstan,

			-- formatting

			null_ls.builtins.formatting.fixjson,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.pint,
		},
	},
}
