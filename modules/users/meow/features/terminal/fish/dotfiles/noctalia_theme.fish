set -g fish_color_normal                                 "{{colors.default_fg_source.default.hex}}" \
    --background                                         "{{colors.default_bg_source.default.hex}}"

set -g fish_color_autosuggestion                         "{{colors.lighter_fg_source.default.hex}}"
set -g fish_color_command                                $fish_color_normal
set -g fish_color_comment                                "{{colors.comment_source.default.hex}}"
set -g fish_color_cwd                                    brgreen --bold
set -g fish_color_cwd_root                               $fish_color_cwd
set -g fish_color_end                                    yellow
set -g fish_color_error                                  "{{colors.error_source.default.hex}}"
set -g fish_color_escape                                 yellow
set -g fish_color_host                                   bryellow --bold
set -g fish_color_operator                               yellow
set -g fish_color_param                                  magenta
set -g fish_color_quote                                  "{{colors.constant_source.default.hex}}"
set -g fish_color_redirection                            $fish_color_end
set -g fish_color_search_match                           magenta --bold
set -g fish_color_selection --background                 br"{{colors.selection_bg_source.default.hex}}"
set -g fish_color_status                                 green
set -g fish_color_user                                   brmagenta --bold
set -g fish_color_valid_path                             --underline

set -g fish_pager_color_completion                       $fish_color_normal
set -g fish_pager_color_description                      magenta
set -g fish_pager_color_prefix                           magenta --bold
set -g fish_pager_color_progress                         magenta --bold
set -g fish_pager_color_selected_background --background "{{colors.hover_bg_source.default.hex}}"
set -g fish_pager_color_selected_completion              "{{colors.hover_fg_source.default.hex}}"
set -g fish_pager_color_selected_description             "{{colors.pink_light_source.default.hex}}"
set -g fish_pager_color_selected_prefix                  "{{colors.pink_light_source.default.hex}}" --bold

set -g __fish_git_prompt_color                           brcyan --bold
