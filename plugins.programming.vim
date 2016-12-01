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

" Markdown
"" Plugin: Goyo {{{
  " Distraction-free writing
  Plug 'junegunn/goyo.vim'
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
  " Integrate with Goyo
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
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
