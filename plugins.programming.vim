" plugins.programming.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" Plugin: Vim Polyglot {{{
  " A collection of language packs for Vim
  Plug 'sheerun/vim-polyglot'
  " No conceal in JSON
  let g:vim_json_syntax_conceal=0
  " Enable syntax highlighting for JSDocs
  let g:javascript_plugin_jsdoc=1
"" }}}

"" Plugin: Syntastic {{{
  " Syntax checking for Vim with external syntax checker
  Plug 'scrooloose/syntastic'
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list=1
  let g:syntastic_loc_list_height=5
  let g:syntastic_auto_loc_list=1
  let g:syntastic_check_on_open=1
  let g:syntastic_check_on_wq=0
  " Symbols
  let g:syntastic_error_symbol='✘'
  let g:syntastic_warning_symbol='▲'
  " For C / C++
  let g:syntastic_cpp_compiler='clang++'
  let g:syntastic_cpp_compiler_options=' -std=c++11'
  " For Python
  let g:syntastic_python_checkers=['flake8']
  " For Scala & Java
  " let g:syntastic_scala_checkers=['fsc', 'scalac']
  " For Javascript & Node.JS
  let g:syntastic_javascript_checkers=['eslint']
  let s:eslint_path=system('PATH=$(npm bin):$PATH && which eslint')
  let b:syntastic_javascript_eslint_exec=substitute(s:eslint_path,
  \ '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
  " For Shell Script(sh, bash)
  let g:syntastic_sh_checkers=['shellcheck']
"" }}}

"" Plugin: Deoplete(NeoVIM only) {{{
  " Dark powered asynchronous completion framework
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
    " Javascript source for Neocomplete/Deoplete
    Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript'] }
    let g:tern#command=["tern"]
    let g:tern#arguments=["--persistent"]
  endif
  " Vim source for Neocomplete/Deoplete
  Plug 'Shougo/neco-vim', { 'for': ['vim'] }
  " Insert mode completion of words in adjacent tmux panes
  Plug 'wellle/tmux-complete.vim'
  " Use deoplete.
  let g:deoplete#enable_at_startup=1
  " When a capital letter is included in input, does not ignore
  let g:deoplete#enable_smart_case=1
"" }}}

"" Plugin: UltiSnips {{{
  " Snippet engine for Vim
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  " Configure keys trigerring UltiSnips
  let g:UltiSnipsExpandTrigger='<Tab>'
  let g:UltiSnipsJumpForwardTrigger='<Tab>'
  let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
  let g:UltiSnipsListSnippets='<Tab>l'
  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit='vertical'
"" }}}

"" Plugin: NERD Commenter {{{
  " For intensely orgasmic commenting
  Plug 'scrooloose/nerdcommenter'
  " Comment the whole lines in visual mode
  let g:NERDCommentWholeLinesInVMode=1
  " Add space after the left delimiter and before the right delimiter
  let g:NERDSpaceDelims=1
  " Remove spaces around comment delimiters
  let g:NERDRemoveExtraSpaces=1
"" }}}

" Javascript & Node
"" Plugin: Tern for Vim {{{
  " Tern-based Javascript editing support
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
  " Set timeout
  let g:tern_request_timeout=1
  " Display argument type hints when the cursor is left over a function
  let g:tern_show_argument_hints='on_hold'
  " Display function signature in the completion menu
  let g:tern_show_signature_in_pum=0
  " Disable Shortcuts
  let g:tern_map_keys=0
"" }}}

" Markdown
"" Plugin: Goyo {{{
  " Distraction-free writing
  Plug 'junegunn/goyo.vim'
  " Integrate with other plugins
  function! s:goyo_enter()
    silent !tmux set status off
    set noshowmode
    set noshowcmd
    set scrolloff=999
    Limelight
    LocalIndentGuide -hl -cc
  endfunction

  function! s:goyo_leave()
    silent !tmux set status on
    set showmode
    set showcmd
    set scrolloff=3
    Limelight!
    LocalIndentGuide +hl +cc
  endfunction
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
"" }}}

"" Plugin: Limelight {{{
  " Hyperfocus-writing in Vim
  Plug 'junegunn/limelight.vim'
  " Set coefficient value
  let g:limelight_default_coefficient=0.7
  " Configure the number of preceding/following paragraphs to include
  let g:limelight_paragraph_span=1
  " Set shortcut to toggle limelight
  nnoremap <Leader>l :Limelight!!<CR>
  xnoremap <Leader>l :Limelight!!<CR>
"" }}}

"" Plugin: Vim Instant Markdown {{{
  " Instant markdown Previews from Vim
  Plug 'suan/vim-instant-markdown'
  " Only refresh on specific events
  let g:instant_markdown_slow=1
  " Manually control to launch the preview window
  " Command(:InstantMarkdownPreview)
  let g:instant_markdown_autostart=1
  " Allow external content like images
  let g:instant_markdown_allow_external_content=1
"" }}}
