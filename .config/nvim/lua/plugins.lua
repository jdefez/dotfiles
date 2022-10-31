local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_echo({ { 'Installing packer.nvim', 'Type' } }, true, {})
  Packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- navigation

  use {
    'kazhala/close-buffers.nvim',
    'ggandor/lightspeed.nvim',
    'preservim/vimux',
  }

  use {
    'lambdalisue/fern.vim',
    'lambdalisue/nerdfont.vim',
    'lambdalisue/fern-renderer-nerdfont.vim'
  }

  use {
    'akinsho/bufferline.nvim',
    tag = '*',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}
    end
  }

  use {
    'feline-nvim/feline.nvim',
    config = function()
      require('feline').setup({
        components = require('catppuccin.groups.integrations.feline').get(),
      })
    end
  }

  use {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        -- overwrite default configuration
        -- here, e.g. to enable default bindings
        copy_sync = {
          -- enables copy sync and overwrites all register actions to
          -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
          enable = true,
        },
        navigation = {
          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = true,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = true,
        }
      })
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-dap.nvim'
    },
    config = function()
      require('telescope').setup({})
      require('telescope').load_extension('dap')
    end
  }

  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end
  }

  -- editing

  use {
    'xiyaowong/virtcolumn.nvim',
    'kosayoda/nvim-lightbulb',
    'RRethy/vim-illuminate',
    'folke/which-key.nvim',
    'numToStr/FTerm.nvim',
    'phpactor/phpactor',
    'vim-test/vim-test',
  }

  use {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'onsails/lspkind-nvim',
    {
      'hrsh7th/nvim-cmp',
      config = function()
        require 'cmp-config'
      end
    },
  }

  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }

  use {
    'ms-jpq/coq_nvim',
    branch = 'coq'
  }

  use {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts'
  }

  use {
    'b3nj5m1n/kommentary',
    config = function()
      -- deactivating default mappings to avoid conflicting 'gc' mapping
      vim.g.kommentary_create_default_mappings = false

      require('kommentary.config').configure_language('php', {
        prefer_single_line_comments = true,
      })
    end
  }

  use {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup {}
      require('pretty-fold.preview').setup()
    end
  }

  use {
    'mg979/vim-visual-multi',
    { branch = 'master' }
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup()
    end
  }

  use {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup()
    end
  }

  -- git

  use {
    'tpope/vim-fugitive',
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    'axkirillov/easypick.nvim',
    requires = 'nvim-telescope/telescope.nvim'
  }
  local easypick = require('easypick')
  easypick.setup({
    pickers = {
      {
        name = "conflicts",
        command = "git diff --name-only --diff-filter=U --relative",
        previewer = easypick.previewers.file_diff()
      },
    }
  })

  -- lsp

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jayp0521/mason-nvim-dap.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
  }
  require("mason").setup()
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup({
    ensure_installed = {
      'graphql',
      'html',
      'intelephense',
      'jsonls',
      'sumneko_lua',
      'phpactor',
      'psalm',
      'quick_lint_js',
      'volar',
      'yamlls',
    }
  })
  local null_ls = require('null-ls')
  null_ls.setup({
    sources = {
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.diagnostics.phpstan,
      null_ls.builtins.diagnostics.phpmd,
      null_ls.builtins.completion.spell,
      null_ls.builtins.formatting.standardjs,
      null_ls.builtins.formatting.fixjson,
      null_ls.builtins.formatting.markdownlint,
      null_ls.builtins.formatting.pint,
    }
  })
  mason_lspconfig.setup_handlers({
    function(server_name)
      require("lspconfig")[server_name].setup {
        on_attach = require("lsp-servers").on_attach,
      }
    end
  })

  use {
    'tami5/lspsaga.nvim',
    'b0o/mapx.nvim',
  }

  use {
    'folke/lsp-colors.nvim',
    config = function()
      require('lsp-colors').setup({
        Error = '#db4b4b',
        Warning = '#e0af68',
        Information = '#0db9d7',
        Hint = '#10B981'
      })
    end
  }

  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup();
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  })

  use {
    -- toggle on/off using :ASToggle
    'pocco81/auto-save.nvim',
    config = function()
      require('autosave').setup()
    end
  }

  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        auto_session_enable_last_session = false,
        auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = nil,
        auto_session_suppress_dirs = nil
      }
    end
  }

  -- color schemes

  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if Packer_bootstrap then
    require('packer').sync()
  end
end)
