function fish_title
    # if we're connected via ssh, print the hostname
    set -l ssh
    set -q SSH_TTY
    and set ssh "["(prompt_hostname | string shorten -m 10 | string collect)"]"
    # an override for the current command is passed as the first parameter
    # this is used by `fg` to show the true process name, among others
    if set -q argv[1]
        # detect and abbreviate any paths inside the command just as `prompt_pwd -d 1 -D 1` does
        set -l cmd_tokens (commandline --input=$argv[1] --tokens-expanded)
        for i in (seq (count $cmd_tokens))
            set -l -- token $cmd_tokens[$i]
            # not all paths contain a slash, but only the ones that contain a slash are multiple
            # "parts" long and hence need to be abbreviated
            if string match -q -- '*/*' $token
                set cmd_tokens[$i] (prompt_pwd -d 1 -D 1 -- $token)
            end
        end
        set -l abbr_cmd (string join -- ' ' $cmd_tokens)
        echo -s -- $ssh (string shorten -m 25 -- $abbr_cmd) " " (prompt_pwd -d 1 -D 1)
    else
        # don't print "fish" because it's redundant
        set -l cmd (status current-command)
        if test "$cmd" = fish
            set cmd
        end
        echo -s -- $ssh (string shorten -m 25 -- $cmd) (prompt_pwd -d 1 -D 1)
    end
end
