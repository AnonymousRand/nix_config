{
  flake.homeModules.meow = { config, my, ... }: {
    programs.ghostty = {
      enable = true;
    };

    xdg.configFile."ghostty/config.ghostty".source           = my.dotfiles + /ghostty/config.ghostty;
    xdg.configFile."ghostty/shaders/nyan_cursor.glsl".source = my.dotfiles + /ghostty/shaders/nyan_cursor.glsl;

    # Noctalia theming
    programs.noctalia = {
      settings = {
        theme.templates.user.ghostty = {
          input_path = builtins.toString (my.dotfiles + /ghostty/themes/noctalia_theme);
          output_path = "$XDG_CONFIG_HOME/ghostty/themes/noctalia_theme";
          post_hook = "pgrep -f ghostty > /dev/null && pkill -SIGUSR2 ghostty || true";
        };

        theme.templates.user.ghostty-css = {
          input_path = builtins.toString (my.dotfiles + /ghostty/custom.css);
          output_path = "$XDG_CONFIG_HOME/ghostty/custom.css";
          post_hook = "pgrep -f ghostty > /dev/null && pkill -SIGUSR2 ghostty || true";
        };
      };
    };
  };
}
