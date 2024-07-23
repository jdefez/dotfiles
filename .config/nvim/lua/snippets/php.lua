-- NOTE: function reference:
--  https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snippetnode

local ls = require('luasnip')

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")

-- lua require("luasnip.loaders").edit_snippet_files()

ls.add_snippets("php",
  {
    s("fna", {
      t("fn ("), i(1, "item"), t(") => "), extras.rep(1), i(0)
    })
  })

ls.add_snippets("php", {
  s("prim", fmt([[private function <> (
      <>
    )<> {
      <>
    }]], {
    i(1, "methodName"),
    i(2),
    i(3),
    i(0, "body"),
  }, {
    delimiters = "<>"
  }))
})

ls.add_snippets("php", {
  s("pubm", fmt([[public <> function <> (
      <>
    )<> {
      <>
    }]], {
    i(1),
    i(2, "methodName"),
    i(3),
    i(4),
    i(0, "body"),
  }, {
    delimiters = "<>"
  }))
})

ls.add_snippets("php", {
  s("dtoc", fmt([[<<?php
  final class <> {
    public function __construct(
      <>
    ) {
    }

    /**
      * @param array<<array-key, mixed>> $data
      */
    public static function make(
      array $data
    ): static {
      return new static(
        <>
      );
    }
  }
  ]], {
    i(1, "ClassName"),
    i(2, "propertyName"),
    i(0),
  }, {
    delimiters = "<>"
  }))
})
