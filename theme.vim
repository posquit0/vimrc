" theme.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


" Enable 256 colors in vim
set t_Co=256
" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen
if &term =~ '256color'
  set t_ut=
endif
" Set to 'dark' to use colors that look good on dark background
" Set to 'light' to use colors that look good on a light background
" set background=dark
" Set colorscheme
" colorscheme summerfruit256
" colorscheme gruvbox
" colorscheme seoul256-light
colorscheme molokai
