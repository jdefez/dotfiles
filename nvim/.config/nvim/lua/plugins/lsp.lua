return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "phpactor",
        "phpstan",
        "stylua",
        "fixjson",
        "lua-language-server",
        "phpactor",
        "pint",
        "stylua",
        "xmlformatter",
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    -- event = "VeryLazy",
    event = "LspAttach",
    config = function()
      vim.diagnostic.config {
        virtual_text = false,
        update_in_insert = false,
        severity_sort = true,
        float = {
          show_header = true,
          source = "if_many",
          border = "rounded",
          focusable = false,
        },
      }
      require("tiny-inline-diagnostic").setup()
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      keymaps = {
        show_help = "?",
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        peek_location = "o",
        goto_and_close = "<S-Cr>",
        restore_location = "<C-g>",
        hover_symbol = "<C-space>",
        toggle_preview = "P",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_toggle = "<Tab>",
        fold_toggle_all = "<S-Tab>",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
        down_and_jump = "<C-j>",
        up_and_jump = "<C-k>",
      },
    },
  },
  {
    "dnlhc/glance.nvim",
    config = true,
    lazy = true,
    cmd = "Glance",
    keys = {
      { "gl", "<CMD>Glance references<CR>", desc = "Glance references" },
      { "gM", "<CMD>Glance implementations<CR>", desc = "Glance implementations" },
      -- { "gD", "<CMD>Glance definitions<CR>", desc = "Glance definitions" },
      -- { "gY",  "<CMD>Glance type_definitions<CR>", desc = "Glance type definitions" },
    },
  },
}
