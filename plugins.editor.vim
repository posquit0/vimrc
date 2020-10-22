" plugins.editor.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" All trailing whitespace characters to be highlighted
"" Plugin: Vim Better Whitespace {{{
  " Disable this plugin for specific file types
  let g:better_whitespace_filetypes_blacklist=[
  \ 'diff', 'gitcommit', 'unite', 'qf', 'help', 'nerdtree', 'startify'
  \ ]
  " Strip all trailing whitespace everytime save the file
  autocmd BufWritePre * StripWhitespace
"" }}}


"" The fastest (Neo)Vim plugin for asynchronously displaying the colours in the file
"" Plugin: Colorizer {{{
  " Method to highlight
  let g:Hexokinase_highlighters=['backgroundfull']
  " Patterns to match for all filetypes
  let g:Hexokinase_optInPatterns = [
  \ 'full_hex',
  \ 'triple_hex',
  \ 'rgb',
  \ 'rgba',
  \ 'hsl',
  \ 'hsla',
  \ 'colour_names'
  \ ]
"" }}}


"" Maintain a yank history to cycle between when pasting
"" Plugin: Yoink {{{
  " History size
  let g:yoinkMaxItems=5
  " When set to 1, delete operations such as x or d or s will also be added to the yank history
  let g:yoinkIncludeDeleteOperations=0
  " When we reach the beginning or end of the yank history, the swap will stop there
  let g:yoinkSwapClampAtEnds=0

  " Key mappings for yank
  "nmap <c-n> <plug>(YoinkPostPasteSwapBack)
  "nmap <c-p> <plug>(YoinkPostPasteSwapForward)
  "nmap p <plug>(YoinkPaste_p)
  "nmap P <plug>(YoinkPaste_P)
  nmap <expr> p yoink#canSwap() ? '<plug>(YoinkPostPasteSwapBack)' : '<plug>(YoinkPaste_p)'
  nmap <expr> P yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<plug>(YoinkPaste_P)'
  nmap [y <plug>(YoinkRotateBack)
  nmap ]y <plug>(YoinkRotateForward)
"" }}}


"" Provides additional text objects
"" Plugin: Targets {{{
"" }}}


"" EditorConfig plugin for Vim
"" Ensure that this plugin works well with Tim Pope's fugitive
"" Plugin: EditorConfig {{{
  " Avoid loading EditorConfig for any remote files over ssh
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"" }}}


"" Bringing Sublime Text's awesome multiple selection feature into Vim
"" Plugin: Vim Multiple Cursors {{{
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


"" For intensely orgasmic commenting
"" Plugin: Auto Pairs {{{
  " Shortcut for fast wrapping the word
  let g:AutoPairsShortcutFastWrap='<C-e>'
  " Enable FlyMode
  let g:AutoPairsFlyMode=1
  " Insert the key at the Fly Mode jumped postion
  let g:AutoPairsShortcutBackInsert='<C-b>'
"" }}}


"" All about surroundings: parenthless, brackets, quotes, XML tags and more
"" Plugin: Vim Surround {{{
"" }}}


"" Displaying thin vertical lines at each indentation level for code
"" TODO: Very slow after Goyo mode and with long line files
"" Plugin: indentLine {{{
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
  let g:indentLine_fileTypeExclude=['vim', 'json', 'markdown', 'nerdtree']
  " Specify a list of buffer names to disable indentline
  let g:indentLine_bufNameExclude=['NERD_tree.*']
  " Whether to show leading spaces
  let g:indentLine_leadingSpaceEnabled=1
  " Specify a character to show for leading spaces
  let g:indentLine_leadingSpaceChar='·'
  " Allow to see the concealed in the current cursor line
  " when in normal & indent mode as intended
  let g:indentLine_noConcealCursor=''
"" }}}


"" Display a guide for the current line's indent level
"" Enable it with options(+hl, -hl, +cc, -cc)
"" Plugin: Local Indent Guide {{{
  " autocmd FileType * LocalIndentGuide +hl +cc
"" }}}


"" Show the context of the currently visible buffer contents
"" Plugin: Context {{{
  " Whether to enable the context plugin
  let g:context_enabled=1
  " INFO: Issue in Neovim which leads to some artefacts
  let g:context_nvim_no_redraw=1
" }}}


"" Highlight the flooding part of an overly long line
"" Plugin: Lengthmatters {{{
  " Highlight when opening a new window
  let g:lengthmatters_on_by_default=1
  " Whether to highlight based on the value of textwidth
  let g:lengthmatters_use_textwidth=1
  " Fallback if textwidth is not set
  let g:lengthmatters_start_at_column=81
  " No highlight when the file is read-only
  let g:lengthmatters_exclude_readonly=1
"" }}}


"" Toggles between hybrid and absolute line numbers automatically
"" Plugin: Number Toggle {{{
"" }}}
