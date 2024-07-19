local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local fmt = require('luasnip.extras.fmt').fmt
local types = require("luasnip.util.types")

-- lua require("luasnip.loaders").edit_snippet_files()
-- https://github.com/L3MON4D3/LuaSnip/wiki/Cool-Snippets#python

return {
  s("pub", {
    t("public function "), i(1, "methodName"), t(" (")
    t({ "", "" }), i(2),
    t({ "", ")" }), i(3), t(" {"),
    t({ "", "" }), i(0, "// Body"),
    t({ "", "}" }),
  })
}
