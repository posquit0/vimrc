" plugins.search.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" Plugin: CtrlP {{{
  " Full path fuzzy file, buffer, mru, tag finder for Vim
  Plug 'kien/ctrlp.vim'
  let g:ctrlp_map='<c-p>'
  let g:ctrlp_cmd='CtrlP'
"" }}}

"" Plugin: Easymotion {{{
  " Provides a much simpler way to use motions in Vim
  Plug 'Lokaltog/vim-easymotion'
"" }}}

"" Plugin: Vim Signature {{{
  " To place, toggle, display and navigate marks
  " Keymap:
  " mx        Toggle mark 'x' where x is a-zA-Z
  " dmx       Remove mark 'x' where x is a-zA-Z
  " m,        Place the next available mark
  " m.        If no mark on line, place the next available mark
  " m-        Delete all marks from the current line
  " m/        Open location list and display marks
  " m<Space>  Delete all marks from the current buffer
  " m[0-9]    Toggle the corresponding marker !@#$%^&*()
  " m<S-[0-9]>Remove all markers of the same type
  " m?        Open location list and display markers
  " m<BS>     Remove all markers
  " ]`        Jump to next mark
  " [`        Jump to prev mark
  " ]'        Jump to start of next line containg a mark
  " ['        Jump to start of prev line containg a mark
  Plug 'kshenoy/vim-signature'
  " Highlight signs of marks dynamically based upon state
  " indicated by vim-signify
  let g:SignatureMarkTextHLDynamic=1
"" }}}

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
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree')
  \ && b:NERDTree.isTabTree()) | q | endif
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
