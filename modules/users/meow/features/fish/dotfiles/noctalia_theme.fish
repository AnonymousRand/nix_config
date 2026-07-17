set -g fish_color_normal                                 "{{colors.terminal_foreground.default.hex}}" \
    --background                                         "{{colors.terminal_background.default.hex}}"

set -g fish_color_autosuggestion                         "{{colors.lighter_fg_source.default.hex}}"
set -g fish_color_command                                $fish_color_normal
set -g fish_color_comment                                "{{colors.comment_source.default.hex}}"
set -g fish_color_cwd                                    brgreen
set -g fish_color_cwd_root                               magenta
set -g fish_color_end                                    yellow
set -g fish_color_error                                  "{{colors.error_source.default.hex}}"
set -g fish_color_escape                                 yellow
set -g fish_color_host                                   bryellow
set -g fish_color_operator                               yellow
set -g fish_color_param                                  brmagenta
set -g fish_color_quote                                  "{{colors.constant_source.default.hex}}"
set -g fish_color_redirection                            $fish_color_end
set -g fish_color_search_match                           magenta --bold
set -g fish_color_selection --background                 "{{colors.terminal_selection_bg.default.hex}}"
set -g fish_color_status                                 brgreen
set -g fish_color_user                                   magenta
set -g fish_color_valid_path                             --underline

set -g fish_pager_color_completion                       $fish_color_normal
set -g fish_pager_color_description                      brmagenta
set -g fish_pager_color_prefix                           magenta --bold
set -g fish_pager_color_progress                         magenta --bold
set -g fish_pager_color_selected_background --background "{{colors.hover_bg_source.default.hex}}"
set -g fish_pager_color_selected_completion              "{{colors.hover_fg_source.default.hex}}"
set -g fish_pager_color_selected_description             "{{colors.pink_source.default.hex}}"
set -g fish_pager_color_selected_prefix                  "{{colors.pink_source.default.hex}}" --bold

set -g __fish_git_prompt_color                           brcyan

# custom variables for `fish_prompt`
set -g prompt_scales_blue                                "{{colors.fish_scales_blue_source.default.hex}}"
set -g prompt_scales_green                               "{{colors.fish_scales_green_source.default.hex}}"
set -g prompt_scales_orange                              "{{colors.fish_scales_orange_source.default.hex}}"
set -g prompt_scales_pink                                "{{colors.fish_scales_pink_source.default.hex}}"
