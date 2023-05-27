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

  -- utility

  use "nvim-tree/nvim-web-devicons"
  use "jghauser/mkdir.nvim"

  -- themes

  use({ 'projekt0n/github-nvim-theme' })
  use { "catppuccin/nvim", as = "catppuccin" }
  use "olimorris/onedarkpro.nvim"
  use "lourenci/github-colors"
  use "sainnhe/edge"
  use {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim"
  }
  use "ishan9299/modus-theme-vim"
  use "rebelot/kanagawa.nvim"
  use "loctvl842/monokai-pro.nvim"
  use "folke/tokyonight.nvim"
  use "neanias/everforest-nvim"
  use "EdenEast/nightfox.nvim"

  -- navigation

  use "freddiehaddad/feline.nvim"
  use "karb94/neoscroll.nvim"
  use "olimorris/persisted.nvim"
  use "nyngwang/murmur.lua"
  use "aserowy/tmux.nvim"
  use "preservim/vimux"
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
  use "kazhala/close-buffers.nvim"
  use "xiyaowong/virtcolumn.nvim"
  use "chentoast/marks.nvim"
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

  -- git

  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use "tpope/vim-fugitive"

  -- language

  use "jparise/vim-graphql"

  -- editing

  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  use { "mg979/vim-visual-multi", { branch = "master" } }
  use "beauwilliams/focus.nvim"
  use { "kevinhwang91/nvim-bqf", ft = "qf" }
  use "pocco81/auto-save.nvim"
  use "Pocco81/true-zen.nvim"
  use "windwp/nvim-autopairs"
  use "numToStr/FTerm.nvim"
  use "b3nj5m1n/kommentary"
  use { "phaazon/hop.nvim", branch = "v2" }
  use "phpactor/phpactor"

  use "vim-test/vim-test"

  -- completion

  use {
    'hrsh7th/nvim-cmp',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  }

  -- lsp

  use { 'onsails/lspkind.nvim' }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }
  use { "folke/lsp-colors.nvim" }
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate"
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }
  use { "simrat39/symbols-outline.nvim" }
  -- use { "lukas-reineke/lsp-format.nvim" }

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
