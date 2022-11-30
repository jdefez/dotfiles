---@diagnostic disable: undefined-global
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- https://neovimcraft.com/plugin/anuvyklack/pretty-fold.nvim

if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_echo({ { 'Installing packer.nvim', 'Type' } }, true, {})
  local packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'kazhala/close-buffers.nvim',
    'xiyaowong/virtcolumn.nvim',
    'ggandor/lightspeed.nvim',
    -- 'RRethy/vim-illuminate',
    'lambdalisue/gina.vim',
    'folke/which-key.nvim',
    'jparise/vim-graphql',
    'numToStr/FTerm.nvim',
    'tpope/vim-fugitive',
    'phpactor/phpactor',
    'vim-test/vim-test',
    'preservim/vimux',
    'b0o/mapx.nvim',
  }

  -- color schemes

  -- use {
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  --   config = function()
  --     require("catppuccin").setup({
  --       -- latte, frappe, macchiato, mocha
  --       flavour = 'frappe',
  --       background = {
  --         light = "latte",
  --         dark = "mocha",
  --       }
  --     })
  --   end
  -- }

  use({
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup({
        theme_style = 'dark',
        dark_float = true,
        dark_sidebar = true,
        function_style = 'italic',
        variable_style = 'bold'
      })
    end
  })

  use {
    'kaicataldo/material.vim',
    { branch = 'main' }
  }

  -- navigating

  use({
    "gnikdroy/projections.nvim",
    config = function()
      require("projections").setup({
        workspaces = { -- Default workspaces to search for
          { '~/Code', { '.git' } },
          -- dev is a workspace. default patterns is used (specified below)
          -- "~/dev",

          -- Documents/dev is a workspace. patterns = { ".git" }
          -- { "~/Documents/dev", { ".git" } },

          -- An empty pattern list indicates that all subfolders are considered projects
          -- { "~/repos", {} },
        },
        patterns = { ".git", ".svn", ".hg" }, -- Default patterns to use if none were specified. These are NOT regexps.
        store_hooks = { pre = nil, post = nil }, -- pre and post hooks for store_session, callable | nil
        restore_hooks = { pre = nil, post = nil }, -- pre and post hooks for restore_session, callable | nil
      })

      -- Bind <leader>p to Telescope find_projects
      -- on select, switch to project's root and attempt to load project's session
      local Workspace = require("projections.workspace")
      require('telescope').load_extension('projections')
      vim.keymap.set("n", "<leader>fp", function()
        local find_projects = require("telescope").extensions.projections.projections
        find_projects({
          action = function(selection)
            -- chdir is required since there might not be a session file
            vim.fn.chdir(selection.value)
            Session.restore(selection.value)
          end,
        })
      end, { desc = "Find projects" })

      -- Autostore session on DirChange and VimExit
      local Session = require("projections.session")
      vim.api.nvim_create_autocmd({ 'DirChangedPre', 'VimLeavePre' }, {
        callback = function() Session.store(vim.loop.cwd()) end,
        desc = "Store project session",
      })

      -- If vim was started with arguments, do nothing
      -- If in some project's root, attempt to restore's that project's session
      -- If not, restore last session
      -- If no sessions, do nothing
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
          if vim.fn.argc() ~= 0 then return end
          local session_info = Session.info(vim.loop.cwd())
          if session_info == nil then
            Session.restore_latest()
          else
            Session.restore(vim.loop.cwd())
          end
        end,
        desc = "Restore last session automatically"
      })
    end
  })

  use {
    'nyngwang/murmur.lua',
    config = function()
      require('murmur').setup({
        cursor_rgb = 'purple', -- default to '#393939'
        max_len = 80, -- maximum word-length to highlight
        -- disable_on_lines = 2000, -- to prevent lagging on large files. Default to 2000 lines.
        exclude_filetypes = {},
        callbacks = {
          -- to trigger the close_events of vim.diagnostic.open_float.
          function()
            -- Close floating diag. and make it triggerable again.
            vim.cmd('doautocmd InsertEnter')
            vim.w.diag_shown = false
          end,
        },
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

  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }

  use {
    'lambdalisue/fern.vim',
    'TheLeoP/fern-renderer-web-devicons.nvim',
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
        -- components = require('catppuccin.groups.integrations.feline').get(),
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

  -- editing

  use {
    'ms-jpq/coq_nvim',
    branch = 'coq'
  }

  use {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts'
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- toggle on/off using :ASToggle

  use {
    'pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup()
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

      require('kommentary.config').configure_language('lua', {
        prefer_single_line_comments = true,
      })
    end
  }

  use {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup {}
    end
  }

  use {
    'mg979/vim-visual-multi',
    { branch = 'master' }
  }

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

  use {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup()
    end
  }

  -- use {
  --   'rmagatti/auto-session',
  --   config = function()
  --     require('auto-session').setup({
  --       log_level = 'info',
  --       auto_session_enable_last_session = false,
  --       auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
  --       auto_session_enabled = true,
  --       auto_save_enabled = nil,
  --       auto_restore_enabled = nil,
  --       auto_session_suppress_dirs = nil,
  --       auto_session_use_git_branch = nil,
  --       bypass_session_save_file_types = nil
  --     })
  --   end
  -- }

  -- lsp

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").init_lsp_saga({
        -- your configuration
      })
    end,
  })

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
      -- 'intelephense',
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
      -- null_ls.builtins.diagnostics.phpmd,
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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
