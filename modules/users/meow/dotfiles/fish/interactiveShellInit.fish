# apparently it's good practice to put functions in `./functions/`, so. do that!!

################################################################################
# vim mode
################################################################################

set -g fish_key_bindings       fish_vi_key_bindings

set -g fish_cursor_default     block
set -g fish_cursor_insert      line blink
set -g fish_cursor_replace_one block
set -g fish_cursor_replace     underscore
set -g fish_cursor_visual      block
set -g fish_cursor_external    block

################################################################################
# aliases
################################################################################

alias clear="tput reset" # make `clear` also clear scrollback history, like default behavior in bash
