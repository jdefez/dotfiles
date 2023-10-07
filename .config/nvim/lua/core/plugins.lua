local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- colorschemes

  use "projekt0n/github-nvim-theme"
  -- use "loctvl842/monokai-pro.nvim"
  -- use "ishan9299/modus-theme-vim"
  use "askfiy/visual_studio_code"
  -- use "maxmx03/solarized.nvim"
  -- use "EdenEast/nightfox.nvim"
  -- use "folke/tokyonight.nvim"
  -- use "rebelot/kanagawa.nvim"
  -- use "jaredgorski/spacecamp"
  use "roobert/palette.nvim"
  -- use "Mofiqul/dracula.nvim"
  -- use { "catppuccin/nvim", as = "catppuccin" }
  -- use "Shatur/neovim-ayu"
  -- use "sainnhe/sonokai"
  -- use "rakr/vim-one"

  -- utility

  use "nvim-tree/nvim-web-devicons" // skipped
  use "jghauser/mkdir.nvim"

  -- navigation

  use { "akinsho/toggleterm.nvim", tag = '*' } // skipped
  use "mrjones2014/smart-splits.nvim"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }
  use "karb94/neoscroll.nvim"
  -- use "olimorris/persisted.nvim"
  use({
    "coffebar/neovim-project",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim", tag = "0.1.0" },
      { "Shatur/neovim-session-manager" },
    }
  })
  use {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons",
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    }
  }
  use "kazhala/close-buffers.nvim" // skipped
  use "xiyaowong/virtcolumn.nvim"
  use "chentoast/marks.nvim" // skipped
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }

  -- git

  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use "sindrets/diffview.nvim"
  use {
    'NeogitOrg/neogit',
    requires = {
      "sindrets/diffview.nvim",
      "nvim-lua/plenary.nvim"
    }
  }
  use "tpope/vim-fugitive"

  -- languages

  use "jparise/vim-graphql"

  -- editing

  use "HiPhish/rainbow-delimiters.nvim"
  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  use { "mg979/vim-visual-multi", { branch = "master" } }
  -- use "beauwilliams/focus.nvim"
  use { "kevinhwang91/nvim-bqf", ft = "qf" }
  use "nyngwang/murmur.lua"
  use({
    "okuuva/auto-save.nvim",
    config = function()
      require("auto-save").setup({})
    end,
  })
  use "folke/zen-mode.nvim" // skipped
  use {
    "altermo/ultimate-autopair.nvim",
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6',
    config = function()
      require('ultimate-autopair').setup({
        --Config goes here
      })
    end,
  }
  -- use "windwp/nvim-autopairs"
  use "b3nj5m1n/kommentary"
  use "phpactor/phpactor" // skipped
  use "vim-test/vim-test" // skipped
  use "github/copilot.vim" // skipped
  use {
    "b0o/incline.nvim", // skipped
    config = function()
      require("incline").setup()
    end,
  }
  use "folke/flash.nvim" // ici

  -- completion

  use {
    "hrsh7th/nvim-cmp",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  }

  -- lsp

  use { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
  }
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      {
        -- Optional
        "williamboman/mason.nvim",
        run = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion

      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/nvim-cmp" },
      { "L3MON4D3/LuaSnip" },
    }
  }
  use { "simrat39/symbols-outline.nvim" }
  use { "folke/lsp-colors.nvim" }
  -- use { "onsails/lspkind.nvim" }
  use { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" }

  -- use({
  --   'ray-x/navigator.lua',
  --   requires = {
  --     { 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
  --     { 'neovim/nvim-lspconfig' },
  --   },
  -- })

  -- messages

  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
