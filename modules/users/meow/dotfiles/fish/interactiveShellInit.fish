source ~/.config/fish/noctalia_theme.fish

################################################################################
# vim mode

set -g fish_key_bindings fish_vi_key_bindings

set -g fish_cursor_default block
set -g fish_cursor_insert line
set -g fish_cursor_replace_one block
set -g fish_cursor_replace underscore
set -g fish_cursor_visual block
set -g fish_cursor_external block

# remove vim mode indicators
function fish_mode_prompt; end

################################################################################
# keybinds

function fish_user_key_bindings
    # change copy keybind from `ctrl + x` to `ctrl + c`
    bind --erase --preset -M insert ctrl-x
    bind --erase --preset -M visual ctrl-x
    bind -M visual ctrl-c fish_clipboard_copy

    # enable `ctrl + r` and `ctrl + s` history pager in vim insert mode still
    bind -M insert ctrl-r history-pager
    bind -M insert ctrl-s pager-toggle-search

    # enable using `ctrl + backspace` to delete word and `alt + backspace` to delete argument in vim insert mode
    bind -M insert ctrl-backspace "if fish_in_macos_terminal; commandline -f backward-kill-token; else commandline -f backward-kill-word; end"
    bind -M insert alt-backspace "if fish_in_macos_terminal; commandline -f backward-kill-word; else commandline -f backward-kill-token; end"
end
