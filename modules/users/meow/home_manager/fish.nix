{
  flake.homeModules.meow = { config, ... }: {
    programs.fish = {
      enable = true;

      interactiveShellInit = with config.meow; let
        theme = "dark-mode"; # TODO eventually replace
      in
        ########################################################################
        # custom colorscheme
        # the 16 ANSI terminal colors (e.g. "cyan") come from kitty's config; use those when possible and logical
        # (for docs, see https://fishshell.com/docs/current/interactive.html)
        # TODO: if light/dark mode configing, put things that are hardcoded (e.g. ansi colors?) into separate block
        # that is appended to this string?

        ''
          set -U fish_color_normal "${colors.${theme}.foreground}" \
            --background "${colors.${theme}.background}"

          set -U fish_color_autosuggestion "${colors.${theme}.foreground-secondary}"
          set -U fish_color_command $fish_color_normal
          set -U fish_color_comment "${colors.${theme}.comments}"
          set -U fish_color_cwd brgreen
          set -U fish_color_cwd_root brmagenta
          set -U fish_color_end "${colors.${theme}.keywords}"
          set -U fish_color_error "${colors.${theme}.very-urgent}"
          set -U fish_color_escape "${colors.${theme}.keywords}"
          set -U fish_color_host yellow
          set -U fish_color_operator $fish_color_normal
          set -U fish_color_param "${colors.pink-xlight}"
          set -U fish_color_quote "${colors.${theme}.constants}"
          set -U fish_color_redirection $fish_color_end
          set -U fish_color_search_match "${colors.${theme}.status-bar-foreground}" \
            --background "${colors.${theme}.status-bar-background}"
          set -U fish_color_selection "${colors.${theme}.selection-discreet-foreground}" \
            --background "${colors.${theme}.selection-discreet-background}"
          set -U fish_color_status "${colors.${theme}.urgent}"
          set -U fish_color_user brmagenta
          set -U fish_color_valid_path --underline

          set -U fish_pager_color_completion $fish_color_normal
          set -U fish_pager_color_description brgreen
          set -U fish_pager_color_prefix brmagenta --bold
          set -U fish_pager_color_progress brmagenta
          set -U fish_pager_color_selected_background \
            --background "${colors.${theme}.status-bar-foreground}"
          set -U fish_pager_color_selected_completion "${colors.${theme}.status-bar-background}"
          set -U fish_pager_color_selected_description magenta
          set -U fish_pager_color_selected_prefix magenta --bold
        '';
    };
  };
}
