function fish_title
    # if we're connected via ssh, print the hostname
    set -l ssh
    set -q SSH_TTY
    and set ssh "["(prompt_hostname | string shorten -m 10 | string collect)"]"
    # an override for the current command is passed as the first parameter
    # this is used by `fg` to show the true process name, among others
    if set -q argv[1]
        echo -s -- $ssh (string shorten -m 40 -- $argv[1]) " " (prompt_pwd -d 1 -D 1)
    else
        # don't print "fish" because it's redundant
        set -l command (status current-command)
        if test "$command" = fish
            set command
        end
        echo -s -- $ssh (string shorten -m 40 -- $command) (prompt_pwd -d 1 -D 1)
    end
end
