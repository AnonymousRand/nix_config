set -g fish_color_normal "{{ colors.terminal_foreground.default.hex }}" \
  --background "{{ colors.terminal_background.default.hex }}"

set -g fish_color_autosuggestion "{{ colors.surface_variant.default.hex }}"
set -g fish_color_command $fish_color_normal
set -g fish_color_comment "{{ colors.comments_source.default.hex }}"
set -g fish_color_cwd brgreen
set -g fish_color_cwd_root magenta
set -g fish_color_end yellow
set -g fish_color_error "{{ colors.error_source.default.hex }}"
set -g fish_color_escape yellow
set -g fish_color_host yellow
set -g fish_color_operator yellow
set -g fish_color_param "{{ colors.keywords_source.default.hex }}"
set -g fish_color_quote "{{ colors.constants_source.default.hex }}"
set -g fish_color_redirection $fish_color_end
set -g fish_color_search_match magenta --bold
set -g fish_color_selection --background "{{ colors.selection_discreet_bg_source.default.hex }}"
set -g fish_color_status "{{ colors.warning_source.default.hex }}"
set -g fish_color_user magenta
set -g fish_color_valid_path --underline

set -g fish_pager_color_completion $fish_color_normal
set -g fish_pager_color_description brgreen
set -g fish_pager_color_prefix magenta --bold
set -g fish_pager_color_progress magenta
set -g fish_pager_color_selected_background --background "{{ colors.terminal_selection_bg.default.hex }}"
set -g fish_pager_color_selected_completion "{{ colors.terminal_selection_fg.default.hex }}"
set -g fish_pager_color_selected_description "{{ colors.pink_source.default.hex }}"
set -g fish_pager_color_selected_prefix "{{ colors.pink_source.default.hex }}" --bold
