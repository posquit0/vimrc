" plugins.programming.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" A collection of language packs for Vim
"" Plugin: Vim Polyglot {{{
  " No conceal in JSON
  let g:vim_json_syntax_conceal=0
  " Enable syntax highlighting for JSDocs
  let g:javascript_plugin_jsdoc=1

  " Markdown
  let g:vim_markdown_conceal=0
"" }}}


"" Asynchronous Lint Engine
"" Plugin: ALE {{{
  " Enable ALE
  let g:ale_enable=1
  " Set the language specific linters
  let g:ale_linters={
  \ 'javascript': ['eslint'],
  \ 'python': ['flake8'],
  \ 'lua': ['luac', 'luacheck'],
  \ 'terraform': ['tflint'],
  \ 'yaml': ['yamllint'],
  \ }
  " Set aliases from one filetype to another
  let g:ale_linter_aliases={
  \ 'javascript': ['javascript', 'javascript.jsx', 'jsx'],
  \ }
  " No lint everytime for my battery
  let g:ale_lint_on_text_changed='normal'
  " Run after the delay
  let g:ale_lint_delay=400
  " Run on opening a file
  let g:ale_lint_on_enter=1
  " Run on saving a file
  let g:ale_lint_on_save=1
  " Run on leaving insert mode
  let g:ale_lint_on_insert_leave=1
  " Don't open loclist if false
  let g:ale_open_list=1
  " Set the number of error lines
  let g:ale_list_window_size=3
  " Customize the output format of statusline
  let g:ale_statusline_format=['⨉ %d', '⚠ %d', '⬥ ok']
  " Customize the echo message
  let g:ale_echo_msg_error_str='E'
  let g:ale_echo_msg_warning_str='W'
  let g:ale_echo_msg_format='[%severity%:%linter%] %s'

  nnoremap <silent> <C-l>p :ALEPreviousWrap<CR>
  nnoremap <silent> <C-l>n :ALENextWrap<CR>
"" }}}


"" Async :make and linting framework for Vim/NeoVim
"" Plugin: NeoMake {{{
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
  " Change highlight color for the columns recognized
  augroup neomake_highlights_hook
    autocmd!
    autocmd ColorScheme * highlight NeomakeError
      \ term=bold cterm=bold guibg=red ctermbg=red
    autocmd ColorScheme * highlight NeomakeErrorSign
      \ term=bold cterm=bold guifg=red ctermfg=red
  augroup END
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
  let g:neomake_sh_enabled_makers=['shellcheck']
  let g:neomake_vim_enabled_makers=['vint']
"" }}}


"" Syntax checking for Vim with external syntax checker
"" Plugin: Syntastic {{{
  " TODO: Too slow because of synchronous job
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


"" Asynchronous build and test dispatcher
"" Plugin: Vim Dispatch {{{
"" }}}


"" Run your tests at the speed of thought
"" Plugin: Vim Test {{{
  " Make test commands execute using other strategy
  let test#strategy='basic'
  " Exit after testing with jest
  let test#javascript#jest#options='--passWithNoTests'
  nnoremap <silent> <leader>Tf :TestFile<CR>
  nnoremap <silent> <leader>Tn :TestNearest<CR>
  nnoremap <silent> <leader>Ts :TestSuit<CR>
  nnoremap <silent> <leader>Tl :TestLast<CR>
  nnoremap <silent> <leader>Tv :TestVisit<CR>
"" }}}


"" Displays function signatures from completions in the command line
"" Plugin: EchoDoc {{{
"" }}}


"" Dark powered asynchronous completion framework
"" Plugin: Deoplete {{{
  " Javascript source for Deoplete
  " Add extra filetypes
  let g:tern#filetypes=['jsx', 'javascript.jsx', 'vue']
  " Use tern_for_vim
  let g:tern#command=['tern']
  let g:tern#arguments=['--persistent']
  " Include documentation strings (if found) in the result data
  let g:deoplete#sources#ternjs#docs=1
  " Use a case-insensitive compare
  let g:deoplete#sources#ternjs#case_insensitive=1
  " Sort the result set
  let g:deoplete#sources#ternjs#sort=1
  " Ignore JavaScript keywords when completing
  let g:deoplete#sources#ternjs#include_keywords=0

  " Python source for Deoplete
  " Enable caching of completions for faster results
  let g:deoplete#sources#jedi#enable_cache=1
  " Show docstring in preview window
  let g:deoplete#sources#jedi#show_docstring=0

  if executable('gocode')
    " Go source for Deoplete
    " By default(not set), Find the gocode binary in $PATH environment
    let g:deoplete#sources#go#gocode_binary=$GOPATH.'/bin/gocode'
    " By default, the completion word list is in the sort order of gocode
    " Available values are [package, func, type, var, const]
    let g:deoplete#sources#go#sort_class=['package', 'func', 'type', 'var', 'const']
    " Use static json caching Go stdlib package API
    let g:deoplete#sources#go#use_cache=1
    let g:deoplete#sources#go#json_directory='~/.cache/deoplete/go/$GOOS_$GOARCH'
  endif
  " Run deoplete automatically
  let g:deoplete#enable_at_startup=1
  call deoplete#enable()
  " Delay the completion after input in milliseconds
  call deoplete#custom#option('auto_complete_delay', 200)
  " Set the limit of candidates
  call deoplete#custom#option('max_list', 64)
  " Set the number of the input completion at the time of key input
  call deoplete#custom#option('min_pattern_length', 2)
  " When a capital letter is included in input, does not ignore
  call deoplete#custom#option('smart_case', v:true)
  " Close the preview window after completion is done
  autocmd CompleteDone * pclose!
  " Disable the preview window
  set completeopt-=preview
"" }}}


"" Language server for JavaScript and TypeScript
"" Plugin: Language Servers {{{
"" }}}


"" Intellisense engine, full language server protocol support as VSCode
"" Plugin: CoC(Conquer of Completion) {{{
"" }}}


"" Support Language Server Protocol for NeoVIM
"" Plugin: LanguageClient(NeoVIM only) {{{
  if has('nvim')
    " Automatically start language servers
    let g:LanguageClient_autoStart=1
    " Define commands to execute to start language servers
    let g:LanguageClient_serverCommands={
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['pyls'],
    \ 'javascript': ['node', '$VIM_HOME/plugged/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'javascript.jsx': ['node', '$VIM_HOME/plugged/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'jsx': ['node', '$VIM_HOME/plugged/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }
    " Disable diagnostics integration
    let g:LanguageClient_diagnosticsEnable=0
    " Set selection UI used when there are multiple entries
    let g:LanguageClient_selectionUI='fzf'

    " nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
    " nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    " nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
  endif
"" }}}


"" Snippet engine for Vim
"" Plugin: UltiSnips {{{
  " Explicitly set Python version to use
  if has('python3')
    let g:UltiSnipsUsePythonVersion=3
  else
    let g:UltiSnipsUsePythonVersion=2
  endif
  " Configure keys trigerring UltiSnips
  let g:UltiSnipsExpandTrigger='<Tab>'
  let g:UltiSnipsJumpForwardTrigger='<Tab>'
  let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
  let g:UltiSnipsListSnippets='<Tab>l'
  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit='vertical'
"" }}}


"" Wisely add `end` in ruby, vim, etc
"" Plugin: Endwise {{{
"" }}}


"" For intensely orgasmic commenting
"" Plugin: NERD Commenter {{{
  " Comment the whole lines in visual mode
  let g:NERDCommentWholeLinesInVMode=1
  " Add space after the left delimiter and before the right delimiter
  let g:NERDSpaceDelims=1
  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs=1
  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines=1
  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace=1
"" }}}


"" The interactive scratchpad for hackers
"" Plugin: Codi {{{
  " Set shortcut to toggle Codi
  nnoremap <Leader><Leader>c :Codi!!<CR>
  xnoremap <Leader><Leader>c :Codi!!<CR>
"" }}}


"""""" Javascript & Node
"" TODO: Key mapping
"" Tern-based Javascript editing support
"" Plugin: Tern for Vim {{{
  " Set timeout
  let g:tern_request_timeout=1
  " Display argument type hints when the cursor is left over a function
  let g:tern_show_argument_hints='on_hold'
  " Display function signature in the completion menu
  let g:tern_show_signature_in_pum='0'
  " Disable Shortcuts
  let g:tern_map_keys=0
"" }}}


"" Tools and environment to make Vim superb for developing with Node.js
"" Plugin: Vim Node {{{
"" }}}


"" Syntax file for JavaScript libraries
"" Plugin: Javascript Libraries Syntax {{{
  " Set up used libraries
  let g:used_javascript_libs='react,jquery,underscore,handlebars'
"" }}}


"""""" HTML & CSS
"" Provide Zen-coding for Vim
"" Plugin: Emmet {{{
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
  \ }
"" }}}


"""""" Markdown
"" Distraction-free writing
"" Plugin: Goyo {{{
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


"" Hyperfocus-writing in Vim
"" Plugin: Limelight {{{
  " Set coefficient value
  let g:limelight_default_coefficient=0.7
  " Configure the number of preceding/following paragraphs to include
  let g:limelight_paragraph_span=1
  " Set shortcut to toggle limelight
  nnoremap <Leader><Leader>l :Limelight!!<CR>
  xnoremap <Leader><Leader>l :Limelight!!<CR>
"" }}}

"" Plugin: Vim Instant Markdown {{{
  " Instant markdown Previews from Vim
  " Only refresh on specific events
  let g:instant_markdown_slow=1
  " Manually control to launch the preview window
  " Command(:InstantMarkdownPreview)
  let g:instant_markdown_autostart=1
  " Allow external content like images
  let g:instant_markdown_allow_external_content=1
"" }}}
