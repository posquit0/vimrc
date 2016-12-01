" plugins.editor.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" Plugin: Vim Better Whitespace {{{
  " All trailing whitespace characters to be highlighted
  Plug 'ntpeters/vim-better-whitespace'
  " Disable this plugin for specific file types
  let g:better_whitespace_filetypes_blacklist=[
  \ 'diff', 'gitcommit', 'unite', 'qf', 'help', 'nerdtree'
  \ ]
  " Strip all trailing whitespace everytime save the file
  autocmd BufWritePre * StripWhitespace
"" }}}
