return {
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    after = "catppuccin",
    config = function()
      require("bufferline").setup {
        highlights = require("catppuccin.groups.integrations.bufferline").get()
      }
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        themable = true,
        -- separator_style = 'slant'
      },
    },
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
      { "bl", "<cmd>:BufferLineMoveNext<CR>",        desc = "Move buffer right" },
      { "bh", "<cmd>:BufferLineMovePrev<CR>",        desc = "Move buffer left" },
      { "bp",         "<cmd>:BufferLinePick<CR>",            desc = "Pick buffer" },
      { "bch",        "<cmd>:BufferLineCloseLeft<CR>",       desc = "Close left buffers" },
      { "bcl",        "<cmd>:BufferLineCloseRight<CR>",      desc = "Next right buffers" },
      -- { "bP",         "<cmd>:BufferLineTogglePin<CR>",       desc = "Pin/Unpin buffer" },
    },
  },
  -- {
  --   -- rose-pine: customzes bufferline.
  --   'akinsho/bufferline.nvim',
  --   event = 'ColorScheme',
  --   config = function()
  --     local highlights = require('rose-pine.plugins.bufferline')
  --     require('bufferline').setup({ highlights = highlights })
  --   end
  -- },
  {
    "kazhala/close-buffers.nvim",
    config = true,
    keys = {
      -- buffer delete
      {
        "<leader>bz",
        function()
          require("close_buffers").delete({ type = "hidden", force = true })
        end,
        desc = "Delete all non-visible buffers",
      },
      {
        "<leader>bu",
        function()
          require("close_buffers").delete({ type = "nameless" })
        end,
        desc = "Delete all buffers without name",
      },
      {
        "<leader>bc",
        function()
          require("close_buffers").delete({ type = "this" })
        end,
        desc = "Delete the current buffer",
      },

      -- buffer wipeout
      {
        "<leader>ba",
        function()
          require("close_buffers").wipe({ type = "all", force = true })
        end,
        desc = "Wipe all buffers",
      },
      {
        "<leader>bo",
        function()
          require("close_buffers").wipe({ type = "other", force = true })
        end,
        desc = "Wipe all buffers except the current focused",
      },
    },
  },
}
