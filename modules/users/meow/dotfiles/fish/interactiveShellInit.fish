source ~/.config/fish/noctalia_theme.fish

################################################################################
# vim mode

set -g fish_key_bindings fish_vi_key_bindings
set -g fish_cursor_default block
set -g fish_cursor_insert line
set -g fish_cursor_replace underscore
set -g fish_cursor_replace_one underscore
set -g fish_cursor_visual block
set -g fish_cursor_external block

################################################################################
# keybinds

# change copy keybind from `ctrl + x` to `ctrl + c`
bind --erase --preset -M insert ctrl-x
bind --erase --preset -M visual ctrl-x
bind --preset -M insert ctrl-c fish_clipboard_copy
bind --preset -M visual ctrl-c fish_clipboard_copy

# enable `ctrl + r` and `ctrl + s` history pager in vim insert mode still
bind --user -M insert ctrl-r history-pager
bind --user -M insert ctrl-s pager-toggle-search

# enable using `ctrl + backspace` to delete word and `alt + backspace` to delete argument in vim insert mode
bind --user -M insert ctrl-backspace "if fish_in_macos_terminal; commandline -f backward-kill-token; else commandline -f backward-kill-word; end"
bind --user -M insert alt-backspace "if fish_in_macos_terminal; commandline -f backward-kill-word; else commandline -f backward-kill-token; end"
