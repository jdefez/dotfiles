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

  -- icons

  use "nvim-tree/nvim-web-devicons"
  -- use "TheLeoP/fern-renderer-web-devicons.nvim"

  -- themes [with undercurl support]

  use "loctvl842/monokai-pro.nvim"
  use "folke/tokyonight.nvim"
  use "rebelot/kanagawa.nvim"
  use "sainnhe/edge"
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim"
  }
  use "neanias/everforest-nvim"

  -- themes [no undercurl support]

  -- use "lourenci/github-colors"
  -- use { "catppuccin/nvim", as = "catppuccin" }
  -- use "ishan9299/modus-theme-vim"

  -- utility
  use "jghauser/mkdir.nvim"

  -- ui

  use({
    "folke/noice.nvim",
    config = function()
      require("noice").setup({})
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })

  -- navigation

  use "olimorris/persisted.nvim"
  use "beauwilliams/focus.nvim"
  use "feline-nvim/feline.nvim"
  use "karb94/neoscroll.nvim"
  -- use "lambdalisue/fern.vim"
  use "nyngwang/murmur.lua"
  use { "phaazon/hop.nvim", branch = "v2" }
  use "aserowy/tmux.nvim"
  use "preservim/vimux"
  use {
    "akinsho/bufferline.nvim",
    tag = "*",
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
    "akinsho/toggleterm.nvim",
    tag = '*',
  }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
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
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use "tpope/vim-fugitive"

  -- editing

  -- use { "ms-jpq/coq_nvim", branch = "coq" }
  -- use { "ms-jpq/coq.artifacts", branch = "artifacts" }

  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  use { "mg979/vim-visual-multi", { branch = "master" } }
  use { "kevinhwang91/nvim-bqf", ft = "qf" }
  use "pocco81/auto-save.nvim"
  use "Pocco81/true-zen.nvim"
  use "windwp/nvim-autopairs"
  use "b3nj5m1n/kommentary"
  use "phpactor/phpactor"
  use "vim-test/vim-test"

  use {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    -- snipets
    'hrsh7th/cmp-vsnip',
    -- Todo: migrate php snipts @doc is here:
    --  https://github.com/hrsh7th/vim-vsnip#3-create-your-own-snippet
    'hrsh7th/vim-vsnip',
  }

  -- lsp

  use "onsails/lspkind.nvim"
  use "simrat39/symbols-outline.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use "jose-elias-alvarez/null-ls.nvim"
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
