" plugins.themes.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" Theme: Molokai {{{
  Plug 'tomasr/molokai'
  " Match the original monokai background color
  let g:molokai_original=1
  " Bring the 256 color version
  let g:rehash256=1
"" }}}
"" Theme: Gruvbox {{{
  Plug 'morhetz/gruvbox'
  " Uses 256 color palette
  " Set option value to 16 to fallback
  let g:gruvbox_termcolors=256
  " Change darkmode contrast. Possible values are `soft`, `medium`, `hard`
  let g:gruvbox_contrast_dark='medium'
  " Change lightmode contrast. Possible values are `soft`, `medium`, `hard`
  let g:gruvbox_contrast_light='hard'
  " Change cursor background
  let g:gruvbox_hls_cursor='green'
  " Inverts indent guides
  let g:gruvbox_invert_indent_guides=0
"" }}}
"" Theme: Zenburn {{{
  Plug 'jnurmine/Zenburn'
"" }}}
"" Theme: Solarized {{{
  Plug 'altercation/vim-colors-solarized'
"" }}}
"" Theme: Seoul256 {{{
  Plug 'junegunn/seoul256.vim'
"" }}}
"" Theme: Base16 {{{
  Plug 'chriskempson/base16-vim'
"" }}}
"" Theme: All-in-One {{{
  Plug 'flazz/vim-colorschemes'
"" }}}
