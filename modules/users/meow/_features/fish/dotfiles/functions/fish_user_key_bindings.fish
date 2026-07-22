function fish_user_key_bindings
    # remove `ctrl + x` and `ctrl + v` copy/paste keybinds, but leave them to the terminal emulator
    # except for copying in visual mode, which ghostty at least doesn't seem to be able to do
    bind --erase --preset -M insert  ctrl-x
    bind --erase --preset -M visual  ctrl-x
    bind --erase --preset -M default ctrl-v
    bind --erase --preset -M insert  ctrl-v
    bind --erase --preset -M visual  ctrl-v
    bind -M visual ctrl-shift-c fish_clipboard_copy

    # enable `ctrl + r` and `ctrl + s` history pager in vim insert mode still
    bind -M insert ctrl-r history-pager
    bind -M insert ctrl-s pager-toggle-search

    # enable `ctrl + backspace` to delete word and `alt + backspace` to delete argument in vim insert mode
    bind -M insert ctrl-backspace "if fish_in_macos_terminal; commandline -f backward-kill-token; else commandline -f backward-kill-word; end"
    bind -M insert alt-backspace  "if fish_in_macos_terminal; commandline -f backward-kill-word; else commandline -f backward-kill-token; end"

    # enable `alt + ,` to search forward in previous arguments (`alt + .` should be default, but just in case :3
    bind -M insert alt-. history-token-search-backward
    bind -M visual alt-. history-token-search-backward
    bind -M insert alt-comma  history-token-search-forward
    bind -M visual alt-comma  history-token-search-forward

    ############################################################################
    # keybinds to remove for ghostty `unconsumed` mode

    bind --erase --preset -M default ctrl-y
    bind --erase --preset -M insert  ctrl-y
    bind --erase --preset -M visual  ctrl-y

    bind --erase --preset -M default ctrl-u
    bind --erase --preset -M insert  ctrl-u
    bind --erase --preset -M visual  ctrl-u

    bind --erase --preset -M default ctrl-d
    bind --erase --preset -M insert  ctrl-d
    bind --erase --preset -M visual  ctrl-d

    bind --erase --preset -M default ctrl-i
    bind --erase --preset -M insert  ctrl-i
    bind --erase --preset -M visual  ctrl-i
end
