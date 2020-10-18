" plugins.vcs.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" Plugin: Vim Git {{{
  " For syntax highlighting and other Git niceties
"" }}}

"" Plugin: Vim Fugitive {{{
  " The best Git wrapper
  " Key mappings for convenience
  nnoremap <leader>gs :Gstatus<CR>:20wincmd +<CR>
  nnoremap <leader>gw :Gwrite<CR>
  nnoremap <leader>gci :Gcommit --verbose<CR>
  nnoremap <leader>gfd :Gvdiff<CR>
  nnoremap <leader>gfD :Gvdiff HEAD<CR>
  nnoremap <leader>gfb :Gblame -w<CR>:vertical resize 26<CR>
"" }}}

"" Plugin: Git Commit Browser {{{
  " A git commit browser in Vim
  " Key mappings for convenience
  nnoremap <leader>gl :GV --all<CR>
  nnoremap <leader>gfl :GV! --all<CR>
"" }}}

"" Plugin: Vim Signify {{{
  " Indicate added, modified and removed lines based on data of VCS
  " Key mappings for hunk jumping
  nmap <leader>gn <plug>(signify-next-hunk)
  nmap <leader>gN <plug>(signify-prev-hunk)
  " Key mappings for hunk diffing
  nnoremap <leader><leader>d :SignifyHunkDiff<CR>
"" }}}

"" Plugin: Committia {{{
  " More pleasant editing on commit messagess
  " Specify the width of the edit window
  let g:committia_edit_window_width=100
  " If the value is 'always', committia.vim always employs single column mode
  let g:committia_use_singlecolumn='fallback'
  " If the width of window is narrower than the value, committia.vim employs single column mode
  let g:committia_min_window_width=180
"" }}}

"" Plugin: Gundo {{{
  " Make browsing Vim's powerful undo tree less painful
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
