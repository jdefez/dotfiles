-- https://sbulav.github.io/vim/neovim-setting-up-luasnip/
local ls = require("luasnip")

-- some shorthands...

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

-- require("luasnip/loaders/from_vscode").lazy_load({
--   paths = {
--     vim.fn.stdpath('config') .. '/snippets',
--   }
-- })

local date = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      func(date, {}),
    }),
  },
  php = {
    snip({
      trig = "fn",
      namr = "Arrow function",
      dscr = "Arrow function"
    }, {
      text("fn ("), insert(1, "arg"), text(") => "), insert(2, "target")
    }),
    -- snip({
    --   trig = "pub",
    --   namr = "public method",
    --   dscr = "Insert a public method"
    -- }, {

    -- })
  }
})
