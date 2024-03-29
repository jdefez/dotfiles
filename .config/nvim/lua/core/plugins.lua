local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- icons

  use("nvim-tree/nvim-web-devicons")

  -- themes

  -- use("projekt0n/github-nvim-theme")
  -- use("loctvl842/monokai-pro.nvim")
  -- use("askfiy/visual_studio_code")
  -- use("ishan9299/modus-theme-vim")
  -- use("EdenEast/nightfox.nvim")
  -- use("maxmx03/solarized.nvim")
  -- use("folke/tokyonight.nvim")
  -- use("rebelot/kanagawa.nvim")
  -- use("jaredgorski/spacecamp")
  -- use("roobert/palette.nvim")
  -- use("Mofiqul/dracula.nvim")
  -- use({ "catppuccin/nvim", as = "catppuccin" })
  -- use("Shatur/neovim-ayu")
  -- use("sainnhe/sonokai")
  -- use("rakr/vim-one")

  -- utility
  -- use("jghauser/mkdir.nvim")

  -- ui

  -- use({
  --   "folke/noice.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  -- })

  -- navigation

  -- use("olimorris/persisted.nvim")
  -- use("nvim-focus/focus.nvim")
  -- use({
  --   "coffebar/neovim-project",
  --   requires = {
  --     { "nvim-lua/plenary.nvim" },
  --     { "nvim-telescope/telescope.nvim", tag = "0.1.0" },
  --     { "Shatur/neovim-session-manager" },
  --   }
  -- })

  -- use({
  --   "nvim-lualine/lualine.nvim",
  --   requires = { "nvim-tree/nvim-web-devicons", opt = true },
  -- })
  -- use("declancm/cinnamon.nvim")
  -- use("nyngwang/murmur.lua")
  -- use("folke/flash.nvim")
  -- use({
  --   "akinsho/bufferline.nvim",
  --   tag = "*",
  --   requires = "nvim-tree/nvim-web-devicons",
  -- })
  -- use({
  --   "nvim-telescope/telescope.nvim",
  --   tag = "0.1.2",
  --   requires = { { "nvim-lua/plenary.nvim" } },
  -- })

  -- use("kazhala/close-buffers.nvim")
  -- use("xiyaowong/virtcolumn.nvim")
  -- use({
  --   "akinsho/toggleterm.nvim",
  --   tag = "*",
  -- })
  -- use({
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --     "MunifTanjim/nui.nvim",
  --   },
  -- })
  -- use({ "mrjones2014/smart-splits.nvim" })

  -- git

  -- use({
  --   "lewis6991/gitsigns.nvim",
  --   requires = { "nvim-lua/plenary.nvim" },
  -- })
  -- use({
  --   "sindrets/diffview.nvim",
  --   requires = "nvim-lua/plenary.nvim",
  -- })
  -- use "tpope/vim-fugitive"
  -- use({
  --   "NeogitOrg/neogit",
  --   requires = {
  --     "sindrets/diffview.nvim",
  --     "nvim-lua/plenary.nvim",
  --   },
  -- })

  -- editing

  -- use("HiPhish/rainbow-delimiters.nvim")
  -- use("b0o/incline.nvim")
  -- use({ "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" })
  -- use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
  -- use({ "mg979/vim-visual-multi", { branch = "master" } })
  -- use({ "kevinhwang91/nvim-bqf", ft = "qf" })
  -- use("okuuva/auto-save.nvim")
  -- use({
  --   "folke/todo-comments.nvim",
  --   requires = "nvim-lua/plenary.nvim",
  -- })
  -- use("folke/zen-mode.nvim")
  -- use("windwp/nvim-autopairs")
  -- use("b3nj5m1n/kommentary")
  -- use("phpactor/phpactor")
  -- use("vim-test/vim-test")
  -- use({ "github/copilot.vim" })

  -- use({
  --   "neovim/nvim-lspconfig",
  --   "hrsh7th/cmp-nvim-lsp",
  --   "hrsh7th/cmp-buffer",
  --   "hrsh7th/cmp-path",
  --   "hrsh7th/cmp-cmdline",
  --   "hrsh7th/nvim-cmp",
  --   "saadparwaiz1/cmp_luasnip",
  --   "rafamadriz/friendly-snippets",
  --   "L3MON4D3/LuaSnip",
  -- })

  -- lsp

  -- use {
  --   "Wansmer/symbol-usage.nvim",
  --   event = "BufReadPre",
  --   config = function()
  --     require('symbol-usage').setup()
  --   end
  -- }
  -- use("onsails/lspkind.nvim")
  -- use("simrat39/symbols-outline.nvim")
  -- use("nvim-treesitter/nvim-treesitter")
  -- use("weilbith/nvim-code-action-menu")
  -- use({
  --   "williamboman/mason.nvim",
  --   "williamboman/mason-lspconfig.nvim",
  --   "jose-elias-alvarez/null-ls.nvim",
  --   "jay-babu/mason-null-ls.nvim",
  -- })
  -- use({
  --   "VonHeikemen/lsp-zero.nvim",
  --   branch = "v3.x",
  --   requires = {
  --     { "neovim/nvim-lspconfig" },
  --     {
  --       "williamboman/mason.nvim",
  --       run = function()
  --         pcall(vim.cmd, "MasonUpdate")
  --       end,
  --     },
  --     { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion

  --     { "hrsh7th/nvim-cmp" },
  --     { "hrsh7th/cmp-nvim-lsp" },
  --     { "L3MON4D3/LuaSnip" },
  --   },
  -- })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
