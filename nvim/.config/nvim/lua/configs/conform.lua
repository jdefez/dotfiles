local options = {
  formatters_by_ft = {
    json = { "fixjson" },
    lua = { "stylua" },
    php = { "pint" },
    xml = { "xmlformatter" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
