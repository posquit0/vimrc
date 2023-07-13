" plugins.terminal.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" https://www.posquit0.com/


"" Terminal manager for (neo)vim
"" Plugin: vim-floaterm {{{
  " Which shell should floaterm use.
  let g:floaterm_shell='zsh'
  let g:floaterm_width=0.8
  let g:floaterm_height=0.8
  " Set it to 'split' or 'vsplit' if you don't want to use floating or popup window.
  let g:floaterm_wintype='float'
  " The position of the floaterm window.
  let g:floaterm_position='center'
  " Key Mappings
  let g:floaterm_keymap_new='<leader>tn'
  let g:floaterm_keymap_toggle='<leader>tt'
  let g:floaterm_keymap_prev='<C-p>'
  let g:floaterm_keymap_next='<C-n>'

  nnoremap <silent> <leader>gg :FloatermNew --cwd=<root> --width=0.9 --height=0.9 lazygit<CR>
"" }}}


