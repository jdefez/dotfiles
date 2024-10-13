return {
  {
    "phpactor/phpactor",
    event = "VeryLazy",
    config = function()
      vim.g.phpactorCompletionIgnoreCase = true
    end,
    keys = {
      { "<leader>p", ":PhpactorContextMenu<CR>", desc = "Phpactor context menu" },
    },
  },
}
