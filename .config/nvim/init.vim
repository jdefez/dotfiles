set nocompatible

filetype on
filetype plugin on
filetype indent on

syntax on

let mapleader = " "

" plugins

call plug#begin('~/.local/share/nvim/site/pack/plugins/start/')
  Plug 'arithran/vim-delete-hidden-buffers'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'anuvyklack/pretty-fold.nvim' 
  Plug 'akinsho/bufferline.nvim'
  Plug 'feline-nvim/feline.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'lourenci/github-colors', { 'branch': 'main' }
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tpope/vim-commentary'
  Plug 'lambdalisue/gina.vim'
  Plug 'karb94/neoscroll.nvim'
  Plug 'Pocco81/AutoSave.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'phpactor/phpactor', {
    \ 'for': 'php',
    \ 'tag': '*',
    \ 'do': 'composer install --no-dev -o'
    \}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf.vim'
  Plug 'preservim/vimux',
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'vim-test/vim-test'
  Plug 'aserowy/tmux.nvim'
call plug#end()

" plugins start up

lua << EOF
require('pretty-fold').setup{}
require("bufferline").setup{}
require('neoscroll').setup()
require('gitsigns').setup()
require('feline').setup()
require("autosave").setup({
  enabled = true,
  execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
  events = {"InsertLeave", "TextChanged"},
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
})
require("tmux").setup({
  -- overwrite default configuration
  -- here, e.g. to enable default bindings
  copy_sync = {
    -- enables copy sync and overwrites all register actions to
    -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
    enable = false,
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
EOF

" colorscheme: delek, morning, zellner, delek, github-colors

set background=light
colorscheme github-colors

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2

" other configs

so ~/.config/nvim/settings.vim
so ~/.config/nvim/coc.vim
so ~/.config/nvim/mappings.vim
