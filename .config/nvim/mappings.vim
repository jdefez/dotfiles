inoremap jj <Esc>

nnoremap Y yy$
nnoremap <leader>n :NERDTreeToggle<CR>

" buffers

nnoremap bn :bnext<CR>
nnoremap bp :bprev<CR>
nnoremap bc :bdelete<CR>
nnoremap bh :DeleteHiddenBuffers<CR>
nnoremap bP :BufferLinePick<CR>

" git

nnoremap <leader>gS :Gina status<CR>
nnoremap <leader>gC :Gina commit<CR>

nnoremap gds :Gvdiffsplit!<CR>
nnoremap dgh :diffget //2<CR>
nnoremap dgl :diffget //3<CR>
nnoremap dp :diffput<CR>
nnoremap dg :diffget<CR>

nnoremap hs :Gitsigns stage_hunk<CR>
nnoremap hu :Gitsigns undo_stage_hunk<CR>
nnoremap hU :Gitsigns reset_buffer_index<CR>
nnoremap hr :Gitsigns reset_hunk<CR>
nnoremap hR :Gitsigns reset_buffer<CR>
nnoremap hS :Gitsigns stage_buffer<CR>
nnoremap hp :Gitsigns preview_hunk<CR>

" fzf

nnoremap <leader>F :Files<CR>
nnoremap <leader>B :Buffers<CR>
nnoremap <leader>C :Colors<CR>
" nnoremap <leader>L :Blines<CR>
nnoremap <Leader>g :Ag <C-R><C-W><CR>
nnoremap <Leader>G :Ag <CR>

" php

augroup PhpactorMappings
  au!
  au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
  au FileType php nmap <buffer> <Leader>tt :PhpactorTransform<CR>
  au FileType php nmap <buffer> <silent> <Leader>ee :PhpactorExtractExpression<CR>
  au FileType php vmap <buffer> <silent> <Leader>ee :<C-u>PhpactorExtractExpression<CR>
  au FileType php vmap <buffer> <silent> <Leader>em :<C-u>PhpactorExtractMethod<CR>

  " au FileType php nmap <buffer> <Leader>gs :PhpactorGenerateAccessor<CR>
  " au FileType php nmap <buffer> <Leader>vv :PhpactorChangeVisibility<CR>
  " au FileType php nmap <buffer> <Leader>e :PhpactorClassExpand<CR>
  " au FileType php nmap <buffer> <Leader>u :PhpactorImportClass<CR>
  " au FileType php nmap <buffer> <Leader>ua :PhpactorImportMissingClasses<CR>
  " au FileType php nmap <buffer> <Leader>cc :PhpactorClassNew<CR>
  " au FileType php nmap <buffer> <Leader>ci :PhpactorClassInflect<CR>
  " au FileType php nmap <buffer> <Leader>mf :PhpactorMoveFile<CR>
  " au FileType php nmap <buffer> <Leader>cf :PhpactorCopyFile<CR>
augroup END

" splits navigation

" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

" splits resize
" (todo: fix! not compatible with alacritty key mappings)

" noremap <S-up> <C-w>+
" noremap <S-down> <C-w>-
" noremap <S-left> <C-w>>
" noremap <S-right> <C-w><

" tests

nnoremap tn :TestNearest<CR>
nnoremap tT :TestFile<CR>
nnoremap ta :TestSuite<CR>
nnoremap tl :TestLast<CR>
nnoremap tg :TestVisit<CR>

" move

nnoremap('<S-Up>', ':m .-2<CR>==')
nnoremap('<S-Down>', ':m .+1<CR>==')
vnoremap('<S-Up>', ':m '<-2<CR>gv=gv')
vnoremap('<S-Down>', ':m '>+1<CR>gv=gv')
