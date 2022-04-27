local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- https://neovimcraft.com/plugin/anuvyklack/pretty-fold.nvim

if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
  local packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
end

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  use {
    'williamboman/nvim-lsp-installer',
    'kazhala/close-buffers.nvim',
    'kosayoda/nvim-lightbulb',
    'neovim/nvim-lspconfig',
    'RRethy/vim-illuminate',
    'folke/which-key.nvim',
    'jparise/vim-graphql',
    'tami5/lspsaga.nvim',
    'tpope/vim-fugitive',
    'preservim/nerdtree',
    'phpactor/phpactor',
    'vim-test/vim-test',
    'preservim/vimux',
    'b0o/mapx.nvim',
  }

  use {
    'feline-nvim/feline.nvim',
    config = function()
      require('feline').setup()
    end
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("bufferline").setup{
        options = {
          show_buffer_close_icons = false,
          show_close_icon = false,
          diagnostics = 'nvim_lsp'
        }
      }
    end
  }

  use { 'mfussenegger/nvim-dap' }

  -- use {
  --   'theHamsta/nvim-dap-virtual-text',
  --   config = function()
  --     require("nvim-dap-virtual-text").setup {
  --       enabled = true,
  --       enabled_commands = true,
  --       highlight_changed_variables = true,
  --       highlight_new_as_changed = true,
  --       all_frames = true,
  --       show_stop_reason = true,
  --       commented = false,
  --   }
  --   end
  -- }

  -- use {
  --   'rcarriga/nvim-dap-ui',
  --   requires = {'mfussenegger/nvim-dap'},
  -- }

  use {
    'ms-jpq/coq_nvim',
    branch = 'coq'
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
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup()
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
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
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

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {}
    end
  }

  use {
    'Pocco81/AutoSave.nvim',
    config = function()
      require('autosave').setup{
        {
          -- toggle on/off using :ASToggle
          enabled = true,
          execution_message = 'AutoSave: saved at ' .. vim.fn.strftime('%H:%M:%S'),
          events = {'InsertLeave', 'TextChanged'},
          conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
          },
          write_all_buffers = false,
          on_off_commands = true,
          clean_command_line_interval = 0,
          debounce_delay = 135
        }
      }
    end
  }

  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        auto_session_enable_last_session = false,
        auto_session_root_dir = vim.fn.stdpath('data')..'/sessions/',
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = nil,
        auto_session_suppress_dirs = nil
      }
    end
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
    'mg979/vim-visual-multi',
    { branch = 'master' }
  }

  use {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup()
      -- require('pretty-fold.preview').setup()
    end
  }

  -- color schemes

  use { 'folke/tokyonight.nvim' }
  use { 'bluz71/vim-nightfly-guicolors' }

  -- use { 'wuelnerdotexe/vim-enfocado' }

  use {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup()
    end
  }

  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  if packer_bootstrap then
    require('packer').sync()
  end
end)
