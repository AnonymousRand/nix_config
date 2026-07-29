# mostly follows default prompt, but with bits from "scales" sample prompt
function fish_prompt
    # disable python's native "(venv)" prompt since they set their own colors
    set -g VIRTUAL_ENV_DISABLE_PROMPT 1
    set -l prompt_venv
    if set -q VIRTUAL_ENV_PROMPT
        set prompt_venv (set_color $fish_color_user)"($VIRTUAL_ENV_PROMPT) "(set_color --reset)
    end

    # color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
    end

    # kitten decorations :3
    set -l kittens (set_color magenta)" ♡ ⊹˚₊ ₍^. .^₎Ⳋ" \
                   (set_color magenta)" ♡₊˚⊹  ฅ₍^•⩊ •マ⟆" \
                   (set_color magenta)" ₊˚⊹ ᓚ₍⑅^..^₎♡"
    set -l rand (random 1 (count $kittens))

    # prompt suffix
    set -l prompt_suffix (set_color magenta --bold)"₊"\
                         (set_color yellow --bold)"˚"\
                         (set_color brgreen --bold)"₊"\
                         (set_color brcyan --bold)"⊹ "(set_color --reset)

    # bracket colors
    set -l color_start_bracket $fish_color_user
    set -l color_end_bracket $color_cwd
    if test -n "$(fish_vcs_prompt)" # this doesn't work without quotes and hence `$` too
        set color_end_bracket $__fish_git_prompt_color
    end

    echo -n -s (set_color $color_start_bracket) "[" \
               $prompt_venv \
               (prompt_login) " " \
               (set_color $color_cwd) (prompt_pwd) \
               (fish_vcs_prompt) \
               (set_color $color_end_bracket) "]" \
               $kittens[$rand] \
               \n $prompt_suffix " "
end
