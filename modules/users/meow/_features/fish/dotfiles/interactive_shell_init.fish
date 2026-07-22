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

# make `clear` also clear scrollback history, like default behavior in bash
alias clear="tput reset"

# make `nix-shell` and `nix develop` open in fish by default instead of bash
alias nix-shell="nix-shell --run fish"
alias nix develop="nix develop -c fish"

################################################################################
# misc
################################################################################

# generally match unicode specification for grapheme widths that many terminals follow
set -g fish_ambiguous_width 2
set -g fish_emoji_width 2
