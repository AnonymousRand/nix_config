function fish_right_prompt
    ############################################################################
    # environments indicator

    # add indication if we are in a `nix-shell`/`nix develop`
    set -l prompt_nix
    if set -q IN_NIX_SHELL
        set prompt_nix "(nix) "
    end

    # disable python's native "(venv)" prompt since they set their own colors
    set -g VIRTUAL_ENV_DISABLE_PROMPT 1
    set -l prompt_venv
    if set -q VIRTUAL_ENV_PROMPT
        set prompt_venv "($VIRTUAL_ENV_PROMPT) "
    end

    ############################################################################
    # status

    # fetch pipestatus
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # export for `__fish_print_pipestatus`

    # if the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    # if there is a nonzero status, print it in right prompt; otherwise print cute stuff :3
    if ! test -n "$prompt_status"
        if string match -qi "*UTF-8*" "$LANG"
                and set -q TERM
                and not string match -qi "linux" "$TERM"
                and not string match -qi "dumb" "$TERM"
            # if nerd font icons are (probably) suppported
            # (note: space after to make the icon display larger/with 2 cells of width)
            set prompt_status " "
        else
            set prompt_status ":3"
        end
    end

    ############################################################################
    # final print

    echo -n -s (set_color $fish_right_prompt_color) " " \
               $prompt_venv \
               $prompt_nix \
               $prompt_status \
               (set_color --reset)
end
