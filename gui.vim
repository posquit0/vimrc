" gui.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" https://www.posquit0.com/


" GUI configuration for each OS

if has('unix')
""" Unix & Linux {{{
  let s:uname=substitute(system('uname -s'), '\n', '', '')
  if s:uname == 'Darwin'
""" OS X {{{
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
""" }}}
  else
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
  endif
""" }}}

elseif has('gui_win32')
""" Window {{{

""" }}}

elseif has('gui_gtk2')
""" GTK32 {{{
""" }}}
endif
