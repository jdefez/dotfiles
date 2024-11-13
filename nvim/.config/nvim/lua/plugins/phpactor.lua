return {
  {
    "phpactor/phpactor",
    ft = { "php" },
    event = "VeryLazy",
    config = function()
      vim.g.phpactorCompletionIgnoreCase = true
    end,
    keys = {
      { "<leader>p", ":PhpactorContextMenu<CR>", desc = "Phpactor context menu" },
    },
  },
}
