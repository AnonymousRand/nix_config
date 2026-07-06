set -U fish_color_normal "{{ colors.terminal_foreground.default.hex }}" \
  --background "{{ colors.terminal_background.default.hex }}"

set -U fish_color_autosuggestion "{{ colors.surface_variant.default.hex }}"
set -U fish_color_command $fish_color_normal
set -U fish_color_comment "{{ colors.comments_source.default.hex }}"
set -U fish_color_cwd brgreen
set -U fish_color_cwd_root brmagenta
set -U fish_color_end yellow
set -U fish_color_error "{{ colors.error_source.default.hex }}"
set -U fish_color_escape yellow
set -U fish_color_host yellow
set -U fish_color_operator yellow
set -U fish_color_param "{{ colors.keywords_source.default.hex }}"
set -U fish_color_quote "{{ colors.constants_source.default.hex }}"
set -U fish_color_redirection $fish_color_end
set -U fish_color_search_match brmagenta --bold
set -U fish_color_selection --background "{{ colors.selection_discreet_source.default.hex }}"
set -U fish_color_status "{{ colors.warning_source.default.hex }}"
set -U fish_color_user brmagenta
set -U fish_color_valid_path --underline

set -U fish_pager_color_completion $fish_color_normal
set -U fish_pager_color_description brgreen
set -U fish_pager_color_prefix brmagenta --bold
set -U fish_pager_color_progress brmagenta
set -U fish_pager_color_selected_background --background "{{ colors.terminal_selection_fg.default.hex }}"
set -U fish_pager_color_selected_completion "{{ colors.terminal_selection_bg.default.hex }}"
set -U fish_pager_color_selected_description "{{ colors.pink_source.default.hex }}"
set -U fish_pager_color_selected_prefix "{{ colors.pink_source.default.hex }}" --bold
