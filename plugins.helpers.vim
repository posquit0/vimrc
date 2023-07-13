" plugins.helpers.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" https://www.posquit0.com/


"" Provide interface for Web API
"" Dependency for Emmet-Vim Custom Snippet
"" Plugin: WebAPI Vim {{{
"" }}}


"" Sudo will ask for your password if need be
"" Usage: :e sudo:/etc/passwd
"" Plugin: Sudo-Vim {{{
"" }}}


"" Small collection of settings, commands and mappings put together to make
"" working with the location/quickfix list/window smoother
"" Plugin: Vim QF {{{
  " Enable Ack style mapping only in location/quickfix windows
  " s - open entry in a new horizontal window
  " v - open entry in a new vertical window
  " t - open entry in a new tab
  " o - open entry and come back
  " O - open entry and close the location/quickfix window
  " p - open entry in a preview window
  let g:qf_mapping_ack_style=1
  " Open the quickfix window at the bottom of the screen
  let g:qf_window_bottom=0
  " Open the location window at the bottom of the screen
  let g:qf_loclist_window_bottom=0
  " Open the quickfix window automatically if there are any errors
  let g:qf_auto_open_quickfix=1
  " Open the location window automatically if there are any locations
  let g:qf_auto_open_loclist=1
"" }}}


"" Provides a set of mappings for enhancing in-buffer search experience
"" Automatically clears search highlight when cursor is moved
"" Improved start-search (visual-mode, highlighting without moving)
"" Plugin: Vim Slash {{{
"" }}}


"" Enable repeating supported plugin maps with `.`
"" Plugin: Repeat.vim {{{
"" }}}
