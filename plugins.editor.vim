" plugins.editor.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" Plugin: Vim Better Whitespace {{{
  " All trailing whitespace characters to be highlighted
  Plug 'ntpeters/vim-better-whitespace'
  " Disable this plugin for specific file types
  let g:better_whitespace_filetypes_blacklist=[
  \ 'diff', 'gitcommit', 'unite', 'qf', 'help', 'nerdtree'
  \ ]
  " Strip all trailing whitespace everytime save the file
  autocmd BufWritePre * StripWhitespace
"" }}}

"" Plugin: Targets {{{
  " Provides additional text objects
  Plug 'wellle/targets.vim'
"" }}}

"" Plugin: EditorConfig {{{
  " EditorConfig plugin for Vim
  Plug 'editorconfig/editorconfig-vim'
  " Ensure that this plugin works well with Tim Pope's fugitive
  " Avoid loading EditorConfig for any remote files over ssh
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"" }}}

"" Plugin: Vim Multiple Cursors {{{
  " Bringing Sublime Text's awesome multiple selection feature into Vim
  Plug 'terryma/vim-multiple-cursors'
  " Turn off the default key bindings
  let g:multi_cursor_use_default_mapping=0
  " Configure custom key bindings
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-p>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'
  " Quit and delete all existing cursor in visual mode after pressing quit key
  let g:multi_cursor_exit_from_visual_mode=1
  " Quit and delete all existing cursor in insert mode after pressing quit key
  let g:multi_cursor_exit_from_insert_mode=0
"" }}}

"" Plugin: Auto Pairs {{{
  " For intensely orgasmic commenting
  Plug 'jiangmiao/auto-pairs'
  " Shortcut for fast wrapping the word
  let g:AutoPairsShortcutFastWrap='<C-e>'
  " Enable FlyMode
  let g:AutoPairsFlyMode=1
  " Insert the key at the Fly Mode jumped postion
  let g:AutoPairsShortcutBackInsert='<C-b>'
"" }}}

"" Plugin: Vim Surround {{{
  " All about surroundings: parenthless, brackets, quotes, XML tags and more
  Plug 'tpope/vim-surround'
"" }}}

"" Plugin: indentLine {{{
  " Displaying thin vertical lines at each indentation level for code
  " TODO: Very slow after Goyo mode and with long line files
  Plug 'Yggdroot/indentLine'
  " Specify a character to  be used as indent line
  let g:indentLine_char='┆'
  " let g:indentLine_char='|'
  " Specify a character to  be used as indent line on the first level
  let g:indentLine_first_char='¦'
  " Whether the first indent level should be shown
  let g:indentLine_showFirstIndentLevel=1
  " Specify how much indent level do you want to use for indentLine
  let g:indentLine_indentLevel=10
  " Specify a list of file types to disable indent line
  let g:indentLine_fileTypeExclude=['vim', 'json', 'markdown']
  " Whether to show leading spaces
  let g:indentLine_leadingSpaceEnabled=1
  " Specify a character to show for leading spaces
  let g:indentLine_leadingSpaceChar='·'
  " Allow to see the concealed in the current cursor line
  " when in normal & indent mode as intended
  let g:indentLine_noConcealCursor=''
"" }}}

"" Plugin: Lengthmatters {{{
  " Highlight the flooding part of an overly long line
  " Plug 'whatyouhide/vim-lengthmatters'
  " Highlight when opening a new window
  let g:lengthmatters_on_by_default=1
  " Whether to highlight based on the value of textwidth
  let g:lengthmatters_use_textwidth=1
  " Fallback if textwidth is not set
  let g:lengthmatters_start_at_column=81
  " No highlight when the file is read-only
  let g:lengthmatters_exclude_readonly=1
"" }}}

"" Plugin: Number Toggle {{{
  " Toggles between hybrid and absolute line numbers automatically
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
"" }}}

"" Plugin: Local Indent Guide {{{
  " Display a guide for the current line's indent level
  " Plug 'tweekmonster/local-indent.vim'
  " Enable it with options(+hl, -hl, +cc, -cc)
  " autocmd FileType * LocalIndentGuide +hl +cc
"" }}}
