{ den, ... }: {
  meow.features.terminal.ghostty = {
    includes = [
      den.aspects.features.terminal.ghostty
    ];

    homeManager = { config, ... }: {
      xdg.configFile."ghostty/config.ghostty".source = ./dotfiles/config.ghostty;
      xdg.configFile."ghostty/shaders/nyan_cursor.glsl".source = ./dotfiles/shaders/nyan_cursor.glsl;

      # noctalia theming
      theme.noctalia-theming.templates = {
        ghostty = {
          input_path = builtins.toString ./dotfiles/themes/noctalia_theme;
          output_path = "$XDG_CONFIG_HOME/ghostty/themes/noctalia_theme";
          post_hook = "pgrep -f ghostty > /dev/null && pkill -SIGUSR2 ghostty || true";
        };

        ghosttyCss = {
          input_path = "${config.theme.compile-scss.cssOutput}/features/terminal/ghostty/dotfiles/custom.css";
          output_path = "$XDG_CONFIG_HOME/ghostty/custom.css";
          post_hook = "pgrep -f ghostty > /dev/null && pkill -SIGUSR2 ghostty || true";
        };
      };
    };
  };
}
