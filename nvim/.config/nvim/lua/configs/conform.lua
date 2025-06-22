local options = {
  formatters_by_ft = {
    yaml = { "yamllint" },
    json = { "fixjson" },
    lua = { "stylua" },
    php = { "pint" },
    xml = { "xmlformatter" },
  },
  notify_on_error = false,
  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
