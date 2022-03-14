set hidden
set encoding=utf-8
set number
set relativenumber
set cursorline
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set incsearch
set ignorecase
set smartcase
set showcmd
set cmdheight=3
set showmode
set showmatch
set hlsearch
set history=1000
set wildmenu
" set wildmode='list:longest'
" set wildignore='*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx'
set noerrorbells
set colorcolumn=81
" set completeopt = 'menu,menuone,noselect'
set foldmethod=indent
set formatoptions+=c " Autowrap comments using textwidth
set formatoptions+=j " Delete comment character when joining commented lines
set formatoptions+=l " Do not wrap lines that have been longer when starting insert mode already
set formatoptions+=n " Recognize numbered lists
set formatoptions+=q " Allow formatting of comments with gq.
set formatoptions+=r " Insert comment leader after hitting <Enter>
set formatoptions+=t " Auto-wrap text using textwidth
set ignorecase
set wrap
set nobackup
set nowritebackup
set pumheight=40
set scrolloff=1000
set shiftround
set shiftwidth=0
set showfulltag
set smartindent
set softtabstop=2
set splitbelow
set undolevels=10000
set termguicolors

" fzf
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']}

" gina

set diffopt=vertical

" neoclide/coc

set updatetime=300
set shortmess+=c
set signcolumn=yes

" phpactor

let phpactorCompletionIgnoreCase=1

" tests

let test#strateg='vimux'
let test#echo_command=0
let test#php#phpunit#options='--testdox'
