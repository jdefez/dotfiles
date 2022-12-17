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
  -- themes

  use "projekt0n/github-nvim-theme"

  -- navigation

  use "TheLeoP/fern-renderer-web-devicons.nvim"
  use "beauwilliams/focus.nvim"
  use "feline-nvim/feline.nvim"
  use "karb94/neoscroll.nvim"
  use "rmagatti/auto-session"
  use "lambdalisue/fern.vim"
  use "nyngwang/murmur.lua"
  use { "phaazon/hop.nvim", branch = "v2" }
  use "aserowy/tmux.nvim"
  use "preservim/vimux"
  use {
    "akinsho/bufferline.nvim",
    tag = "*",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      -- "nvim-telescope/telescope-dap.nvim"
    }
  }
  use "kazhala/close-buffers.nvim"
  use "xiyaowong/virtcolumn.nvim"
  -- git
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use "tpope/vim-fugitive"

  -- editing

  use "anuvyklack/pretty-fold.nvim"
  use { "kevinhwang91/nvim-bqf", ft = "qf" }
  use "pocco81/auto-save.nvim"
  use "windwp/nvim-autopairs"
  use { "mg979/vim-visual-multi", { branch = "master" } }
  use "b3nj5m1n/kommentary"
  use "phpactor/phpactor"
  use "vim-test/vim-test"
  use { "ms-jpq/coq_nvim", branch = "coq" }
  use { "ms-jpq/coq.artifacts", branch = "artifacts" }

  -- lsp

  use "nvim-treesitter/nvim-treesitter"
  use "jose-elias-alvarez/null-ls.nvim"
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }
  use { "glepnir/lspsaga.nvim", branch = "main" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
