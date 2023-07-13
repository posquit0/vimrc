" plugins.search.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" https://www.posquit0.com/


"" Full path fuzzy file, buffer, mru, tag finder for Vim
"" Plugin: CtrlP {{{
  " Change default mapping
  let g:ctrlp_map='<c-p>'
  " Change default command
  let g:ctrlp_cmd='CtrlP'
"" }}}


"" An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc
"" Plugin: LeaderF {{{
"" }}}


"" Full path fuzzy file, buffer, mru, tag finder for Vim
"" A general-purpose command-line fuzzy finder
"" Plugin: Fzf {{{
"" }}}


"" Provides a much simpler way to use motions in Vim
"" Plugin: Easymotion {{{
"" }}}

"" More useful word motions for Vim
"" Plugin: Wordmotion {{{
  " Use to designate extra space characters
  let g:wordmotion_spaces=[]
  let g:wordmotion_uppercase_spaces=['_', '-', '.']
"" }}}


"" To place, toggle, display and navigate marks
"" Plugin: Vim Signature {{{
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
  " Highlight signs of marks dynamically based upon state
  " indicated by vim-signify
  let g:SignatureMarkTextHLDynamic=1
"" }}}


"" Eclipse like task list
"" Plugin: TaskList {{{
  " Map TaskList to <leader>tt
  nnoremap <silent> <leader>tt :TaskList<CR>
"" }}}


"" Easy way to browse the tags
"" Plugin: Tagbar {{{
  " Map TagbarToggle to <F10>
  nnoremap <silent> <F10> :TagbarToggle<CR>
"" }}}


"" Explore filesystem with Vim
"" Plugin: NERDTree {{{
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
  " Map NERDTreeToggle to <F11>
  nnoremap <silent> <F11> :NERDTreeToggle<CR>
"" }}}


"" A plugin of NERDTree showing git status flags
"" Plugin: NERDTree Git Plugin {{{
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


"" NERDTree and tabs together in Vim
"" INFO: Not maintained Plugin
"" Plugin: NERDTree Tabs {{{
"" }}}
