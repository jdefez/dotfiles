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

  -- navigation

  -- https://dotfyle.com/plugins/rebelot/heirline.nvim
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
  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "kazhala/close-buffers.nvim"
  use "xiyaowong/virtcolumn.nvim"
  use "chentoast/marks.nvim"
  -- use {
  --   "b0o/incline.nvim",
  --   config = function()
  --     require('incline').setup()
  --   end
  -- }
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

  -- language

  use "jparise/vim-graphql"

  -- editing

  -- use { "ms-jpq/coq_nvim", branch = "coq" }
  -- use { "ms-jpq/coq.artifacts", branch = "artifacts" }
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  -- use "anuvyklack/pretty-fold.nvim"
  -- use "ray-x/lsp_signature.nvim"
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

  use "onsails/lspkind.nvim"
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  }
  use {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    -- snipets: https://github.com/hrsh7th/vim-vsnip#3-create-your-own-snippet
    -- folder @ echo vsnip_snippet_dir
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  }

  -- lsp

  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "jose-elias-alvarez/null-ls.nvim"
  use 'folke/lsp-colors.nvim'
  -- use {
  --   "glepnir/lspsaga.nvim",
  --   branch = "main",
  --   requires = {
  --     { "nvim-tree/nvim-web-devicons" }
  --   },
  -- }
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate"
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }
  use { 'simrat39/symbols-outline.nvim' }

  -- messages

  use({
    "folke/noice.nvim",
    config = function()
      require("noice").setup()
    end,
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
