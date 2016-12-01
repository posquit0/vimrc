" plugins.search.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" Plugin: Tagbar {{{
  " Easy way to browse the tags
  Plug 'majutsushi/tagbar'
  " Map TagbarToggle to <F10>
  nnoremap <silent> <F10> :TagbarToggle<CR>
"" }}}

"" Plugin: NERDTree {{{
  " Explore filesystem with Vim
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  " Map NERDTreeToggle to <F11>
  nnoremap <silent> <F11> :NERDTreeToggle<CR>
  " Ignore some extensions
  let NERDTreeIgnore=['.o$','.pyc$']
  " Show hidden files
  let NERDTreeShowHidden=1
  " Automatically open NERDTree when vim start up with no files
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
  " Close vim if the only window left open is a NERDTree
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
"" }}}

"" Plugin: NERDTree Git Plugin {{{
  " A plugin of NERDTree showing git status flags
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Use this variable to change symbols
  let g:NERDTreeIndicatorMapCustom = {
  \ 'Modified'  : '*',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Deleted'   : '✖',
  \ 'Dirty'     : '✗',
  \ 'Clean'     : '✔︎',
  \ 'Unknown'   : '?'
  \ }
"" }}}
