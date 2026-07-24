# mostly follows default prompt, but with bits from "scales" sample prompt
function fish_prompt
    # disable python's native "(venv)" prompt since they set their own colors
    set -g VIRTUAL_ENV_DISABLE_PROMPT 1
    set -l prompt_venv
    if set -q VIRTUAL_ENV_PROMPT
        set prompt_venv (set_color $__fish_git_prompt_color)"($VIRTUAL_ENV_PROMPT) "(set_color --reset)
    end

    # color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
    end

    # use prompt suffix inspired by "scales"
    set -l prompt_suffix (set_color $prompt_scales_pink)"❯"\
                         (set_color $prompt_scales_orange)"❯"\
                         (set_color $prompt_scales_green)"❯"\
                         (set_color $prompt_scales_blue)"❯"(set_color --reset)

    echo -n -s $prompt_venv \
               (prompt_login) " " \
               (set_color $color_cwd) (prompt_pwd) \
               (set_color --reset) (fish_vcs_prompt) \
               (set_color --reset) " " $prompt_suffix " "
end
