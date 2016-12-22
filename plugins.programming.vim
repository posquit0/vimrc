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

"" Plugin: NeoMake {{{
  " Async :make and linting framework for Vim/NeoVim
  Plug 'neomake/neomake', { 'for': [
  \ 'c', 'cpp', 'java', 'python', 'javascript', 'scala', 'vim'
  \ ] }
  " Open the location-list or quickfix list with preserving the cursor
  let g:neomake_open_list=2
  " Set the height of hte location-list or quickfix list
  let g:neomake_list_height=6
  " Echo the error for the current line
  let g:neomake_echo_current_error=1
  " Place signs by errors recognized
  let g:neomake_place_signs=1
  " Set the appearance of the signs
  let g:neomake_error_sign={'text': '✖', 'texthl': 'NeomakeErrorSign'}
  let g:neomake_warning_sign={'text': '⚠', 'texthl': 'NeomakeWarningSign'}
  let g:neomake_message_sign={'text': '➤', 'texthl': 'NeomakeMessageSign'}
  let g:neomake_info_sign={'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
  " Highlight the columns of errors recognized
  let g:neomake_highlight_columns=1
  " Highlight the lines of errors recognized
  let g:neomake_highlight_lines=0
  " Run Neomake at save and when reading a file
  function! NeomakeHook()
    if exists(':Neomake')
      augroup neomake_hook
        autocmd!
        autocmd BufWritePost * Neomake
      augroup END
    endif
  endfunction
  autocmd VimEnter * call NeomakeHook()
  " Set makers for each filetype
  let g:neomake_c_enabled_makers=['clang']
  let g:neomake_c_clang_args=['-std=c11', '-Wall', '-Wextra', '-fsyntax-only']
  let g:neomake_cpp_enable_makers=['clang']
  let g:neomake_cpp_clang_args=[
  \ '-std=c++14', '-Wall', '-Wextra', '-fsyntax-only'
  \ ]
  let g:neomake_java_enabled_makers=['javac']
  let g:neomake_python_enabled_makers=['flake8']
  let g:neomake_javascript_enabled_makers=['eslint']
  let s:eslint_path=system('PATH=$(npm bin):$PATH && which eslint')
  let b:neomake_javascript_eslint_exe=substitute(
  \ s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', ''
  \ )
  let g:neomake_scala_enabled_makers=['scalac']
  let g:neomake_vim_enabled_makers=['vint']
"" }}}

"" Plugin: Syntastic {{{
  " Syntax checking for Vim with external syntax checker
  " TODO: Too slow because of synchronous job
  " Plug 'scrooloose/syntastic'
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
    " Add extra filetypes
    let g:tern#filetypes=['jsx', 'javascript.jsx', 'vue']
    let g:tern#command=['tern']
    let g:tern#arguments=['--persistent']
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
  " TODO: Key mapping
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

"" Plugin: Vim Node {{{
  " Tools and environment to make Vim superb for developing with Node.js
  Plug 'moll/vim-node'
"" }}}

"" Plugin: Javascript Libraries Syntax {{{
  " Syntax file for JavaScript libraries
  Plug 'othree/javascript-libraries-syntax.vim'
  " Set up used libraries
  let g:used_javascript_libs='react,jquery,underscore,handlebars'
"" }}}

" HTML & CSS
"" Plugin: Emmet {{{
  " Provide Zen-coding for Vim
  Plug 'mattn/emmet-vim', {
  \ 'for': [
  \   'html', 'haml', 'jinja', 'hbs', 'html.handlebars', 'xml',
  \   'css', 'less', 'sass', 'javascript'
  \ ]
  \}
  " Enable all functions, which is equal to
  " n: normal, i: insert: v: visual, a: all
  let g:user_emmet_mode='a'
  " Remap the default Emmet leader key <C-Y>
  let g:user_emmet_leader_key='<C-Y>'
  " Customize the behavior of the languages
  let g:user_emmet_settings={
  \ 'javascript.jsx': {
  \   'extends': 'jsx',
  \ },
  \ 'javascript': {
  \   'extends': 'jsx',
  \ },
  \ 'xml': {
  \   'extends': 'html',
  \ },
  \ 'haml': {
  \   'extends': 'html',
  \ },
  \ 'jinja': {
  \   'extends': 'html',
  \ },
  \ 'hbs': {
  \   'extends': 'html',
  \ },
  \ 'html.handlebars': {
  \   'extends': 'html',
  \ },
  \}
"" }}}


" Markdown
"" Plugin: Goyo {{{
  " Distraction-free writing
  Plug 'junegunn/goyo.vim'
  " Integrate with other plugins
  function! s:goyo_enter()
    silent !tmux set status off
    set colorcolumn=
    set noshowmode
    set noshowcmd
    set scrolloff=999
    Limelight
    LocalIndentGuide -hl -cc
  endfunction

  function! s:goyo_leave()
    silent !tmux set status on
    set colorcolumn=80
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
