local options = {
  formatters_by_ft = {
    yaml = { "yamllint" },
    json = { "jsonlint" },
    lua = { "stylua" },
    php = { "pint" },
    xml = { "xmlformatter" },
  },
  notify_on_error = false,
  format_on_save = {
    -- NOTE: These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
