{ den, ... }: {
  meow.features.terminal.ghostty =
    let
      noctaliaThemeCfgPath = "fish/noctalia_theme.fish";
    in
    {
      includes = [
        den.aspects.features.terminal.ghostty
      ];

      homeManager = {
        xdg.configFile."ghostty/config.ghostty".source = ./dotfiles/config.ghostty;
        xdg.configFile."ghostty/shaders/nyan_cursor.glsl".source = ./dotfiles/shaders/nyan_cursor.glsl;
      };

      # noctalia theming
      den.aspects.utils.noctalia-theming.templates = {
        ghostty = {
          input_path = builtins.toString ./dotfiles/themes/noctalia_theme;
          output_path = "$XDG_CONFIG_HOME/ghostty/themes/noctalia_theme";
          post_hook = "pgrep -f ghostty > /dev/null && pkill -SIGUSR2 ghostty || true";
        };

        ghosttyCss = {
          input_path = "${den.aspects.utils.compile-scss.cssOutput}/ghostty/dotfiles/custom.css";
          output_path = "$XDG_CONFIG_HOME/ghostty/custom.css";
          post_hook = "pgrep -f ghostty > /dev/null && pkill -SIGUSR2 ghostty || true";
        };
      };
    };
}
