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

        use "TheLeoP/fern-renderer-web-devicons.nvim"
        use "nvim-tree/nvim-web-devicons"
        use "jghauser/mkdir.nvim"

        -- themes
        use "lourenci/github-colors"
        use "sainnhe/edge"
        use {
                "mcchrish/zenbones.nvim",
                requires = "rktjmp/lush.nvim"
        }
        use "ishan9299/modus-theme-vim"
        use "rebelot/kanagawa.nvim"
        use "loctvl842/monokai-pro.nvim"

        -- navigation

        use "freddiehaddad/feline.nvim"
        use "karb94/neoscroll.nvim"
        use "olimorris/persisted.nvim"
        use "lambdalisue/fern.vim"
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
                }
        }
        use "kazhala/close-buffers.nvim"
        use "xiyaowong/virt-column.nvim"

        -- git

        use {
                "lewis6991/gitsigns.nvim",
                requires = { "nvim-lua/plenary.nvim" },
        }
        use "tpope/vim-fugitive"

        -- language
        use "jparise/vim-graphql"

        -- editing

        use { "ms-jpq/coq_nvim", branch = "coq" }
        use { "ms-jpq/coq.artifacts", branch = "artifacts" }

        use "Pocco81/true-zen.nvim"
        use "beauwilliams/focus.nvim"
        use "anuvyklack/pretty-fold.nvim"
        use { "mg979/vim-visual-multi", { branch = "master" } }
        use { "kevinhwang91/nvim-bqf", ft = "qf" }
        use "pocco81/auto-save.nvim"
        use "windwp/nvim-autopairs"
        use "numToStr/FTerm.nvim"
        use "b3nj5m1n/kommentary"
        use { "phaazon/hop.nvim", branch = "v2" }
        use "phpactor/phpactor"
        use "vim-test/vim-test"

        -- lsp

        use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
        use "jose-elias-alvarez/null-ls.nvim"
        use {
                "glepnir/lspsaga.nvim",
                branch = "main",
                requires = {
                        { "nvim-tree/nvim-web-devicons" }
                },
        }
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
