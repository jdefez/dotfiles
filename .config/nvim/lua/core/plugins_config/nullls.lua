local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.gitsigns,

    null_ls.builtins.completion.vsnip,

    null_ls.builtins.diagnostics.phpstan,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "mysql" },
    }),

    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.standardjs,
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.formatting.pint,
    null_ls.builtins.formatting.sqlfluff.with({
      extra_args = { "--dialect", "mysql" },
    }),
  },
})
