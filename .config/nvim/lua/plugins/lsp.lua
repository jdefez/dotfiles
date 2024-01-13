return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        indent = {
          enable = true,
        },
        -- A list of parser names, or "all"
        ensure_installed = {
          "markdown",
          "graphql",
          "phpdoc",
          "python",
          "regex",
          "json",
          "html",
          "yaml",
          "vue",
          "css",
          "lua",
          "php",
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        -- List of parsers to ignore installing (for "all")
        ignore_install = {},
        highlight = {
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
    "luckasRanarison/clear-action.nvim",
    opts = {
      silent = true,
      signs = {
        enable = false,
      },
      mappings = {
        code_action = { "<leader>a", "apply code action" },
        quickfix = { "<leader>q", "apply quickfix" },
        quickfix_next = { "]a", "apply next quickfix" },
        quickfix_prev = { "[a", "apply prev quickfix" },
        -- Consider this as a Hydra or prefixed with a 'refactor' mapping.
        refactor = { "<leader>rr", "apply refactor" },
        refactor_inline = { "<leader>ri", "refactor inline" },
        refactor_extract = { "<leader>re", "refactor extract" },
        refactor_rewrite = { "<leader>rw", "refactor rewrite" },
        -- actions = {
        --     ["rust_analyzer"] = {
        --         -- ["Inline"] = "<leader>ai"
        --         ["Add braces"] = { "<leader>rb", "Add braces" },
        --         ["Insert explicit type"] = { "<leader>rt", "Explicit type" },
        --     },
        -- },
      },
    },
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
      { "gD", "<CMD>Glance definitions<CR>" },
      { "gR", "<CMD>Glance references<CR>" },
      { "gY", "<CMD>Glance type_definitions<CR>" },
      { "gM", "<CMD>Glance implementations<CR>" },
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
        json = { "prettier" },
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
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {},
    keys = {
      {
        "zR",
        function()
          return require("ufo").openAllFolds()
        end,
        desc = "Open folds",
      },
      {
        "zM",
        function()
          return require("ufo").closeAllFolds()
        end,
        desc = "Close folds",
      },
    },
  },
  {
    "roobert/action-hints.nvim",
    config = function()
      require("action-hints").setup({
        use_virtual_text = true,
      })
    end,
  },
}
