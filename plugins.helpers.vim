" plugins.helpers.vim
"
" Maintained by Claud D. Park <posquit0.bj@gmail.com>
" http://www.posquit0.com/


"" Plugin: WebAPI Vim {{{
  " Provide interface for Web API
  " Dependency for Emmet-Vim Custom Snippet
  Plug 'mattn/webapi-vim'
"" }}}

"" Plugin: Sudo-Vim {{{
  " Sudo will ask for your password if need be
  " Usage: :e sudo:/etc/passwd
  Plug 'vim-scripts/sudo.vim'
"" }}}

"" Plugin: Vim QF {{{
  " Small collection of settings, commands and mappings put together to make
  " working with the location/quickfix list/window smoother
  Plug 'romainl/vim-qf'
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

"" Plugin: Vim Slash {{{
  " Provides a set of mappings for enhancing in-buffer search experience
  " Automatically clears search highlight when cursor is moved
  " Improved start-search (visual-mode, highlighting without moving)
  Plug 'junegunn/vim-slash'
"" }}}

"" Plugin: Comfortable Motion {{{
  " Brings physics-based smooth scrolling to the Vim
  " Plug 'yuttie/comfortable-motion.vim'
  " Prevent the plugin from defining those default key mappings
  " let g:comfortable_motion_no_default_key_mappings=1
  " Specify friction coeffecient value
  let g:comfortable_motion_friction=60.0
  " Specify air drag coeffecient value
  let g:comfortable_motion_air_drag=2.0
"" }}}

"" Plugin: Repeat.vim {{{
  " Enable repeating supported plugin maps with `.`
  Plug 'tpope/vim-repeat'
"" }}}

