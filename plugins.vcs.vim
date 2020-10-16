" plugins.vcs.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" Plugin: Vim Git {{{
  " For syntax highlighting and other Git niceties
  Plug 'tpope/vim-git'
"" }}}

"" Plugin: Vim Fugitive {{{
  " The best Git wrapper
  Plug 'tpope/vim-fugitive'
  " Key mappings for convenience
  nnoremap <leader>gd :Gvdiff<CR>
  nnoremap <leader>gD :Gvdiff HEAD<CR>
  nnoremap <leader>gs :Gstatus<CR>:20wincmd +<CR>
  nnoremap <leader>gw :Gwrite<CR>
  nnoremap <leader>gb :Gblame -w<CR>:vertical resize 26<CR>
  nnoremap <leader>gci :Gcommit --verbose<CR>
"" }}}

"" Plugin: Vim Signify {{{
  " Indicate added, modified and removed lines based on data of VCS
  if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
  else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
  endif
  " Key mappings for hunk jumping
  nmap <leader>gn <plug>(signify-next-hunk)
  nmap <leader>gN <plug>(signify-prev-hunk)
  " Key mappings for hunk diffing
  nnoremap <leader><leader>d :SignifyHunkDiff<CR>
"" }}}

"" Plugin: Gundo {{{
  " Make browsing Vim's powerful undo tree less painful
  Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
  " Map GundoToggle to <F12>
  nnoremap <silent> <F12> :GundoToggle<CR>
  " Set the horizontal width of Gundo graph
  let g:gundo_width=40
  " Force the preview window below current windows
  let g:gundo_preview_bottom=1
  " Set 1 to open the right side instead of the left
  let g:gundo_right=0
  " Disable Gundo entirely if machine not support python
  if v:version < '703' || !has('python')
    let g:gundo_disable=1
  endif
  " Rendering diff automatically with cursor move
  let g:gundo_auto_preview=1
"" }}}
