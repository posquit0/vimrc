" plugins.appearance.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" Plugin: Airline {{{
  " Use statusline more effective
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  if exists('$DISPLAY')
    " Automatic population of the g:airline_symbols dictionary with
    " powerline symbols
    let g:airline_powerline_fonts=1
  endif
  " Specify theme for airline
  let g:airline_theme='tomorrow'
  " Show warning and error counts from neomake in vim-airline
  let g:airline#extensions#neomake#enabled=1
  " Show warning and error counts from ALE in vim-airline
  let g:airline#extensions#ale#enabled=1
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#left_sep=''
  let g:airline#extensions#tabline#left_alt_sep='|'
  " Customize a left side of airline
  let g:airline_section_b='%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
  " Customize a right side of airline
  let g:airline_section_y='[%{&fileformat}/%{strlen(&fenc)?&fenc:&enc}]'
  " Use airline's showmode
  set noshowmode
"" }}}

"" Plugin: Vim Startify {{{
  " A fancy start screen for Vim
  Plug 'mhinz/vim-startify'
  " A list of files to bookmark
  let g:startify_bookmarks=[
  \ '~/.vim/vimrc',
  \ '~/.vim/plugins.vim',
  \]
  " A list of Vim regular expressions that filters recently used files
  let g:startify_skiplist=[
  \ 'COMMIT_EDITMSG',
  \ $VIMRUNTIME .'/doc',
  \ 'plugged/.*/doc',
  \ 'bundle/.*/doc',
  \]
"" }}}
