{ den, ... }: {
  meow.features.terminal.ghostty = {
    includes = [
      den.aspects.features.terminal.ghostty
    ];

    homeManager = { config, ... }: {
      xdg.configFile."ghostty/config.ghostty".source = ./dotfiles/config.ghostty;
      xdg.configFile."ghostty/shaders/nyan_cursor.glsl".source = ./dotfiles/shaders/nyan_cursor.glsl;

      # noctalia theming
      utils.theme.noctalia-theming.templates = {
        ghostty = {
          input_path = builtins.toString ./dotfiles/themes/noctalia_theme;
          output_path = "$XDG_CONFIG_HOME/ghostty/themes/noctalia_theme";
          post_hook = "pgrep -f ghostty > /dev/null && pkill -SIGUSR2 ghostty || true";
        };

        ghosttyCss = {
          input_path = "${config.utils.theme.compile-scss.cssOutput}/features/terminal/ghostty/dotfiles/custom.css";
          output_path = "$XDG_CONFIG_HOME/ghostty/custom.css";
          post_hook = "pgrep -f ghostty > /dev/null && pkill -SIGUSR2 ghostty || true";
        };
      };

      #programs.ghostty = {
      #  settings = {
      #    # styling
      #    theme                   = "noctalia_theme";
      #    # force ghostty to use ghostty config (instead of system GTK, for example) to style windows
      #    window-theme            = "ghostty";
      #    custom-shader           = shaders/nyan_cursor.glsl;
      #    custom-shader-animation = true;
      #    gtk-custom-css          = ./custom.css;
      #    gtk-titlebar            = true;
      #    gtk-titlebar-style      = tabs;

      #    # font
      #    font-family           = "Maple Mono NF";
      #    font-size             = 12;
      #    # remove programming ligatures, and other font features (ghostty's defaults override fontconfig)
      #    font-feature          = [ "-calt" "cv61" ];
      #    # as fish uses a variant of the legacy `wcswidth`
      #    grapheme-width-method = legacy;

      #    # shell
      #    command                    = "fish --login --interactive";
      #    # (note that shell integration should work automatically)
      #    shell-integration-features = no-cursor, path, ssh-env, ssh-terminfo, sudo, title;

      #    # system
      #    app-notifications       = no-clipboard-copy, no-config-reload;
      #    bell-features           = attention, no-audio, no-border, no-system, title;
      #    # improve performance by using the same process to spawn multiple instances of ghostty
      #    gtk-single-instance     = true;
      #    clipboard-read          = allow;
      #    clipboard-write         = allow;
      #    # scroll two lines at a time instead of the default 3
      #    mouse-scroll-multiplier = discrete:2;

      #    # launching and closing
      #    # open in same working directory as previous windows/tabs/splits
      #    window-inherit-working-directory = true;
      #    tab-inherit-working-directory    = true;
      #    split-inherit-working-directory  = true;
      #    # if no previous windows, open in home directory
      #    working-directory                = home;
      #    confirm-close-surface            = always;

      #    # cursor
      #    adjust-cursor-thickness = 200%;
      #    cursor-click-to-move    = true;

      #    # layout
      #    unfocused-split-opacity = 0.6;

      #    # scrollback buffer max size in bytes (50 MB ~= 40k lines at 100 cells/line, ~12.5 bytes/cell)
      #    # (see https://github.com/ghostty-org/ghostty/discussions/10175)
      #    scrollback-limit = 50_000_000;
      #  };
      #};
    };
  };
}
