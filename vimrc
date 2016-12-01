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
" List & configuration of plugins separated to two file 'plugins.vim',
" 'plugins.after.vim'.
" It makes this vimrc could also work out-of-box even if not managed by
" dotfiles.
if filereadable(expand('$VIM_HOME/plugins.vim'))
  source $VIM_HOME/plugins.vim
endif

""" Plugin Configuration after loading plug
"if filereadable(expand('$VIM_HOME/plugins.after.vim'))
"  source $VIM_HOME/plugins.after.vim
"endif

""" Override Configuration (because of plugins.vim)
"if filereadable(expand('$VIM_HOME/override.vim'))
"  source $VIM_HOME/override.vim
"endif

""" GUI Specific Configuration
"if has('gui_running')
"  if filereadable(expand('$VIM_HOME/gvim.vim'))
"    source $VIM_HOME/gvim.vim
"  endif
"endif

""" Local Specific Configuration
" Use local vimrc if available
if filereadable(expand('$HOME/.vimrc.local'))
  source $HOME/.vimrc.local
endif
