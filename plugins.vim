" plugins.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


""" Install Plugins {{{
  if has('nvim')
    call plug#begin('$VIM_HOME/plugged.nvim')
  else
    call plug#begin('$VIM_HOME/plugged')
  endif

  "" Helpers
  Plug 'mattn/webapi-vim'
  Plug 'vim-scripts/sudo.vim'
  Plug 'romainl/vim-qf'
  Plug 'junegunn/vim-slash'
  Plug 'tpope/vim-repeat'


  "" Appearance
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mhinz/vim-startify'


  "" Terminal
  Plug 'voldikss/vim-floaterm'


  "" VCS
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
  else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
  endif
  Plug 'rhysd/committia.vim'
  Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }


  "" Search
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
  Plug 'junegunn/fzf', { 'do': 'yes \| ./install --all --no-update-rc' }
  Plug 'chaoren/vim-wordmotion'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'kshenoy/vim-signature'
  Plug 'vim-scripts/TaskList.vim'
  Plug 'majutsushi/tagbar'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }


  "" Editor
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'svermeulen/vim-yoink'
  Plug 'wellle/targets.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'Yggdroot/indentLine'
  " Plug 'tweekmonster/local-indent.vim'
  Plug 'wellle/context.vim'
  " Plug 'whatyouhide/vim-lengthmatters'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  " Plug 'psliwka/vim-smoothie'


  "" Programming
  Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale'
  " Plug 'neomake/neomake', { 'for': [
  " \ 'c', 'cpp', 'java', 'python', 'javascript', 'scala', 'sh', 'vim'
  " \ ] }
  " Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-dispatch'
  Plug 'janko-m/vim-test'
  Plug 'Shougo/echodoc.vim'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript'] }
  Plug 'zchee/deoplete-jedi', { 'for': ['python'] }
  if executable('gocode')
    Plug 'zchee/deoplete-go', { 'do': 'make', 'for': ['go'] }
  endif
  " Vim source for Neocomplete/Deoplete
  Plug 'Shougo/neco-vim', { 'for': ['vim'] }
  " Insert mode completion of words in adjacent tmux panes
  Plug 'wellle/tmux-complete.vim'
  " Plug 'sourcegraph/javascript-typescript-langserver', { 'do': 'npm install && npm run build' }
  " Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install'}
  if has('nvim')
    " Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  endif
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  Plug 'tpope/vim-endwise', {
  \ 'for': [
  \   'ruby', 'vim', 'sh', 'zsh', 'matlab', 'snippets'
  \ ]
  \ }
  Plug 'preservim/nerdcommenter'
  Plug 'metakirby5/codi.vim'
  " Hook into omni completion to handle autocompletion and provide more
  function! BuildTern(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
      !npm install
    endif
  endfunction
  Plug 'marijnh/tern_for_vim', { 'for': ['javascript'], 'do': function('BuildTern') }
  Plug 'moll/vim-node'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'mattn/emmet-vim', {
  \ 'for': [
  \   'html', 'haml', 'jinja', 'hbs', 'html.handlebars', 'xml',
  \   'css', 'less', 'sass', 'javascript'
  \ ]
  \ }
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  " Plug 'suan/vim-instant-markdown'


  "" Integration
  Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
  Plug 'adelarsq/vim-hackernews'
  Plug 'wakatime/vim-wakatime'


  "" Themes
  Plug 'tomasr/molokai'
  Plug 'morhetz/gruvbox'
  Plug 'jnurmine/Zenburn'
  Plug 'altercation/vim-colors-solarized'
  Plug 'junegunn/seoul256.vim'
  Plug 'chriskempson/base16-vim'
  Plug 'flazz/vim-colorschemes'


  call plug#end()
""" }}}

""" Config Plugins {{{
  " Configurations for plugins to load into Vim
  let plugin_configurations=[
  \ 'plugins.helpers.vim',
  \ 'plugins.appearance.vim',
  \ 'plugins.terminal.vim',
  \ 'plugins.vcs.vim',
  \ 'plugins.search.vim',
  \ 'plugins.editor.vim',
  \ 'plugins.programming.vim',
  \ 'plugins.integration.vim',
  \ 'plugins.themes.vim',
  \ ]
  for configuration in plugin_configurations
    let config_path = join([$VIM_HOME, configuration], '/')
    if filereadable(config_path)
      execute 'source ' . config_path
    endif
  endfor
""" }}}
