function fish_right_prompt
    # pipestatus
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

    if [ -n "$prompt_status" ]
        echo -n -s $prompt_status
    else if string match -qi "*UTF-8*" "$LANG"
            and set -q TERM
            and not string match -qi "dumb" "$TERM"
        # if emojis are (probably) suppported
        echo -n -s "🐱"
    else
        echo -n -s ":3"
    end
end
