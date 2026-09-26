# apparently it's good practice to put functions in `./functions/`, so. do that!!

################################################################################
# vim keybinds
################################################################################

set -g fish_key_bindings       fish_vi_key_bindings

set -g fish_cursor_default     block
set -g fish_cursor_insert      line blink
set -g fish_cursor_replace_one block
set -g fish_cursor_replace     underscore
set -g fish_cursor_visual      block
set -g fish_cursor_external    block

################################################################################
# aliases/abbreviations
################################################################################

# (note: use abbreviations with `--position anywhere` instead of aliases to make them
# work with `sudo` as well; no `'sudo '` trick in fish!)

# make `clear` also clear scrollback history, like default behavior in bash
# (use alias instead of abbreviation here since abbreviations only expanded with spaces,
# and this doesn't need to be run with `sudo` anyway)
alias clear="tput reset"

# prompt for confirmation on destructive commands because i am stupid and foolish :3
abbr --add --position anywhere -- rm rm -i
abbr --add --position anywhere -- cp cp -i
abbr --add --position anywhere -- mv mv -i

# make `nix-shell` and `nix develop` open in fish by default instead of bash
# (`nix develop` requires a function since you can't make a multi-word alias)
abbr --add -- nix-shell nix-shell --run fish
function nix
    if test "$argv[1]" = "develop"
        command nix develop -c fish
    else
        command nix $argv
    end
end

################################################################################
# misc
################################################################################

# i think unicode specification is generally 2 cells for ambiguous characters, but our
# custom prompt suffix is glitchy when switching between insert/normal modes in that case
set -g fish_ambiguous_width 1
set -g fish_emoji_width 2
