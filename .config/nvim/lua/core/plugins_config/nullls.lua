local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- code actions

    null_ls.builtins.code_actions.gitsigns,

    -- completion

    null_ls.builtins.completion.vsnip,

    -- diagnostics

    null_ls.builtins.diagnostics.phpstan,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "mysql" },
    }),

    -- formatting

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
