# mostly follows default prompt, but with bits from "scales" sample prompt
function fish_prompt
    # color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
    end

    # use prompt suffix inspired by "scales"
    set -l prompt_suffix (echo -n -s (set_color $prompt_scales_pink) "❯" \
                                     (set_color $prompt_scales_orange) "❯" \
                                     (set_color $prompt_scales_green) "❯" \
                                     (set_color $prompt_scales_blue) "❯" (set_color --reset))

    echo -n -s (prompt_login) " " \
               (set_color $color_cwd) (prompt_pwd) \
               (set_color --reset) (fish_vcs_prompt) \
               (set_color --reset) " " $prompt_suffix " "
end
