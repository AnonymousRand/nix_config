{
  den.aspects.users.meow = {
    homeManager = { config, ... }: {
      xdg.configFile."ghostty/shaders/nyan_cursor.glsl".source = ./dotfiles/shaders/nyan_cursor.glsl;

      # noctalia theming
      batteries.theme.noctalia-theming.templates = {
        ghostty = {
          input_path = builtins.toString ./dotfiles/themes/noctalia_theme;
          output_path = "$XDG_CONFIG_HOME/ghostty/themes/noctalia_theme";
          post_hook = "pgrep -f ghostty > /dev/null && pkill -SIGUSR2 ghostty || true";
        };

        ghosttyCss = {
          input_path = "${config.batteries.theme.compile-scss.cssOutput}/features/terminal/ghostty/dotfiles/custom.css";
          output_path = "$XDG_CONFIG_HOME/ghostty/custom.css";
          post_hook = "pgrep -f ghostty > /dev/null && pkill -SIGUSR2 ghostty || true";
        };
      };

      programs.ghostty = {
        settings = {
          # styling
          theme                   = "noctalia_theme";
          # force ghostty to use ghostty config (instead of system GTK, for example) to style windows
          window-theme            = "ghostty";
          custom-shader           = "./shaders/nyan_cursor.glsl";
          custom-shader-animation = true;
          gtk-custom-css          = "./custom.css";
          gtk-titlebar            = true;
          gtk-titlebar-style      = "tabs";

          # font
          # as fish uses a variant of the legacy `wcswidth`
          grapheme-width-method = "legacy";

          # shell
          command                    = "fish --login --interactive";
          # (note that shell integration should work automatically)
          shell-integration-features = "no-cursor, path, ssh-env, ssh-terminfo, sudo, title";

          # system
          app-notifications       = "no-clipboard-copy, no-config-reload";
          bell-features           = "attention, no-audio, no-border, no-system, title";
          # improve performance by using the same process to spawn multiple instances of ghostty
          gtk-single-instance     = true;
          clipboard-read          = "allow";
          clipboard-write         = "allow";
          # scroll two lines at a time instead of the default 3
          mouse-scroll-multiplier = "discrete:2";

          # launching and closing
          # open in same working directory as previous windows/tabs/splits
          window-inherit-working-directory = true;
          tab-inherit-working-directory    = true;
          split-inherit-working-directory  = true;
          # if no previous windows, open in home directory
          working-directory                = "home";
          confirm-close-surface            = "always";

          # cursor
          adjust-cursor-thickness = "200%";
          cursor-click-to-move    = true;

          # layout
          unfocused-split-opacity = 0.6;

          # scrollback buffer max size in bytes (50 MB ~= 40k lines at 100 cells/line, ~12.5 bytes/cell)
          # (see https://github.com/ghostty-org/ghostty/discussions/10175)
          scrollback-limit = 50 * 1000 * 1000;

          keybind = [
            "ctrl+shift+a=select_all"
            # `performable:` is because `copy_to_clipboard` never works anyway in fish's vi visual mode,
            # so `performable:` passes it down to fish to handle with its own keybind in that case
            "performable:ctrl+shift+c=copy_to_clipboard"
            "ctrl+shift+v=paste_from_clipboard"
            "ctrl+shift+e=copy_url_to_clipboard"
            "performable:shift+h=adjust_selection:left"
            "performable:shift+j=adjust_selection:down"
            "performable:shift+k=adjust_selection:up"
            "performable:shift+l=adjust_selection:right"

            "ctrl+shift+minus=decrease_font_size:1"
            "ctrl+shift+equal=increase_font_size:1"
            "ctrl+shift+0=reset_font_size"

            "ctrl+shift+f=start_search"
            "ctrl+shift+alt+f=search_selection"
            "ctrl+g=navigate_search:next"
            "ctrl+shift+g=navigate_search:previous"
            "performable:escape=end_search"

            "ctrl+shift+delete=clear_screen"
            "ctrl+shift+q=close_surface"

            # (the two config keybinds should be default, just codifying them here)
            "ctrl+,=open_config"
            "ctrl+shift+,=reload_config"
            "ctrl+shift+i=show_gtk_inspector"
            "ctrl+shift+space=toggle_command_palette"

            # scrolling
            "unconsumed:ctrl+e=scroll_page_lines:1"
            "unconsumed:ctrl+y=scroll_page_lines:-1"
            "unconsumed:ctrl+f=scroll_page_down"
            "unconsumed:ctrl+b=scroll_page_up"
            "unconsumed:ctrl+d=scroll_page_fractional:0.5"
            "unconsumed:ctrl+u=scroll_page_fractional:-0.5"
            "ctrl+home=scroll_to_top"
            "ctrl+end=scroll_to_bottom"
            "unconsumed:ctrl+i=jump_to_prompt:-1"
            "unconsumed:ctrl+o=jump_to_prompt:1"
            "ctrl+shift+slash=write_scrollback_file:open"

            # windows
            "ctrl+shift+n=new_window"
            "ctrl+shift+alt+q=close_window"

            # tabs
            "ctrl+shift+t=new_tab"
            "ctrl+tab=next_tab"
            "ctrl+shift+tab=previous_tab"
            "ctrl+alt+tab=move_tab:1"
            "ctrl+alt+shift+tab=move_tab:-1"

            "ctrl+shift+1=goto_tab:1"
            "ctrl+shift+2=goto_tab:2"
            "ctrl+shift+3=goto_tab:3"
            "ctrl+shift+4=goto_tab:4"
            "ctrl+shift+5=goto_tab:5"
            "ctrl+shift+6=goto_tab:6"
            "ctrl+shift+7=goto_tab:7"
            "ctrl+shift+8=goto_tab:8"
            "ctrl+shift+9=last_tab"

            "ctrl+shift+backquote=toggle_tab_overview"
            "ctrl+shift+r=prompt_tab_title"
                      
            # splits
            "ctrl+shift+w>h=new_split:left"
            "ctrl+shift+w>j=new_split:down"
            "ctrl+shift+w>k=new_split:up"
            "ctrl+shift+w>l=new_split:right"

            "ctrl+shift+h=goto_split:left"
            "ctrl+shift+j=goto_split:down"
            "ctrl+shift+k=goto_split:up"
            "ctrl+shift+l=goto_split:right"

            "ctrl+shift+alt+h=resize_split:left,10"
            "ctrl+shift+alt+j=resize_split:down,10"
            "ctrl+shift+alt+k=resize_split:up,10"
            "ctrl+shift+alt+l=resize_split:right,10"

            "ctrl+shift+enter=toggle_split_zoom"
          ];
        };

        clearDefaultKeybinds = true;
      };
    };
  };
}
