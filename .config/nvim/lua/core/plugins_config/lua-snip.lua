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
    snip({
      trig = "pub",
      namr = "public method",
      dscr = "Insert a public method"
    }, {
      text("public function "), insert(1, "name"),
      text("("), insert(2, "args"), text("): "),
      insert(3, "type"),
      text("{"), insert(4, "target"), text("}")
    }),
    snip({
      trig = "var",
      namr = "@var",
      dscr = "Insert @var comment"
    }, {
      text("/** @var "), insert(1, "type"), text(" "), insert(2, "name"), text(" */")
    })
  }
})
