" .vimrc
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/

let $VIM_HOME=$HOME.'/.vim'

""" General Configuration
if filereadable(expand('$VIM_HOME/general.vim'))
  source $VIM_HOME/general.vim
endif
if filereadable(expand('$VIM_HOME/key-mapping.vim'))
  source $VIM_HOME/key-mapping.vim
endif
if filereadable(expand('$VIM_HOME/visual.vim'))
  source $VIM_HOME/visual.vim
endif


""" Plugin Configuration
" All the vim plugins are managed by 'vim-plug'
" List & configuration of plugins separated to several files 'plugins.*.vim'
if filereadable(expand('$VIM_HOME/plugins.vim'))
  source $VIM_HOME/plugins.vim
endif

""" Override Configuration (because of plugins.vim)
"if filereadable(expand('$VIM_HOME/override.vim'))
"  source $VIM_HOME/override.vim
"endif

""" GUI Specific Configuration
if has('gui_running')
 if filereadable(expand('$VIM_HOME/gui.vim'))
   source $VIM_HOME/gui.vim
 endif
endif


""" Theme Configuration
if filereadable(expand('$VIM_HOME/theme.vim'))
  source $VIM_HOME/theme.vim
endif


""" Local Specific Configuration
" Use local vimrc if available
if filereadable(expand('$HOME/.vimrc.local'))
  source $HOME/.vimrc.local
endif
