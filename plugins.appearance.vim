" plugins.appearance.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" Use statusline more effective
"" Plugin: Airline {{{
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
  " Enable displaying tabs, regardless of number
  let g:airline#extensions#tabline#show_tabs=1
  " Disable displaying buffers with a single tab
  let g:airline#extensions#tabline#show_buffers=0
  let g:airline#extensions#tabline#formatter='default'
  " Customize a left side of airline
  let g:airline_section_b='%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
  " Customize a right side of airline
  let g:airline_section_y='[%{&fileformat}/%{strlen(&fenc)?&fenc:&enc}]'
  " Use airline's showmode
  set noshowmode
"" }}}


"" A fancy start screen for Vim
"" Plugin: Vim Startify {{{
  " A list of files to bookmark
  let g:startify_bookmarks=[
  \ '~/.vim/vimrc',
  \ '~/.vim/plugins.vim',
  \ '~/.zshrc',
  \ ]
  " A list of Vim regular expressions that filters recently used files
  let g:startify_skiplist=[
  \ 'COMMIT_EDITMSG',
  \ $VIMRUNTIME .'/doc',
  \ 'plugged/.*/doc',
  \ 'bundle/.*/doc',
  \ ]
  let g:ascii = [
  \ '        __',
  \ '.--.--.|__|.--------.',
  \ '|  |  ||  ||        |',
  \ ' \___/ |__||__|__|__|',
  \ ''
  \ ]
  let g:startify_custom_header=startify#pad(g:ascii + startify#fortune#boxed())
  " When opening a file or bookmark, change to its directory
  let g:startify_change_to_dir=1
  " When opening a file or bookmark, seek and change to the root directory of the VCS
  let g:startify_change_to_vcs_root=0
  " The number of spaces used for left padding
  let g:startify_padding_left=3
"" }}}
