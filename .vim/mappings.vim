inoremap jj <Esc>

nnoremap Y y$
nnoremap <leader>n :NERDTreeToggle<CR>

" buffers

nnoremap bn :bnext<CR>
nnoremap bp :bprev<CR>
nnoremap bc :bdelete<CR>
nnoremap bh :DeleteHiddenBuffers<CR>

" git

nnoremap <leader>gs :Gina status<CR>
nnoremap <leader>gc :Gina commit<CR>

nnoremap gds :Gvdiffsplit!<CR>
nnoremap dgh :diffget //2<CR>
nnoremap dgl :diffget //3<CR>
nnoremap dp :diffput<CR>
nnoremap dg :diffget<CR>

" fzf

nmap <leader>F :Files<CR>
nmap <leader>B :Buffers<CR>
nmap <leader>C :Colors<CR>

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

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" splits resize
" (! not compatible with alacritty key mappings)

noremap <S-up> <C-w>+
noremap <S-down> <C-w>-
noremap <S-left> <C-w>>
noremap <S-right> <C-w><
