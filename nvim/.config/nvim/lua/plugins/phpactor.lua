return {
  {
    "phpactor/phpactor",
    event = "VeryLazy",
    ft = { "php" },
    keys = {
      { "<leader>p", ":PhpactorContextMenu<CR>", desc = "Phpactor context menu" },
    },
    run = ":PhpactorUpdate",
  },
}
