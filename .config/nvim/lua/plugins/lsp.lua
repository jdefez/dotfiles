return {
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
    -- deprecated plugin
    "luckasRanarison/clear-action.nvim",
    opts = {
      silent = true,
      signs = {
        enable = false,
      },
      mappings = {
        code_action = { "<leader>a", "apply code action" },
        quickfix_next = { "]a", "apply next quickfix" },
        quickfix_prev = { "[a", "apply prev quickfix" },
        -- quickfix = { "<leader>q", "apply quickfix" },
        -- refactor = { "<leader>rr", "apply refactor" },
        -- refactor_inline = { "<leader>ri", "refactor inline" },
        -- refactor_extract = { "<leader>re", "refactor extract" },
        -- refactor_rewrite = { "<leader>rw", "refactor rewrite" },
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    -- event = "VeryLazy",
    config = function()
      require('tiny-inline-diagnostic').setup()
    end
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
      { "gD", "<CMD>Glance definitions<CR>",     desc = "Glance definitions" },
      { "gl", "<CMD>Glance references<CR>",      desc = "Glance references" },
      { "gM", "<CMD>Glance implementations<CR>", desc = "Glance implementations" },
      -- { "gY",  "<CMD>Glance type_definitions<CR>", desc = "Glance type definitions" },
    },
  },
  {
    "stevearc/conform.nvim",
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>lf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        json = { "fixjson" },
        lua = { "stylua" },
        php = { "pint" },
        xml = { "xmlformatter" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
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
