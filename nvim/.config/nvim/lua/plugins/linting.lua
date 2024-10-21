return {
  {
    "mfussenegger/nvim-lint",
    name = "lint",
    lazy = true,
    event = "BufWritePost",
    config = function()
      require("lint").linters_by_ft = {
        php = "phpstan",
      }
    end,
    init = function()
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
