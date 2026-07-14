{
  flake.homeModules.meow = { config, my, ... }: {
    programs.ghostty = {
      enable = true;
    };

    xdg.configFile."ghostty/config.ghostty".source           = ./dotfiles/config.ghostty;
    #xdg.configFile."ghostty/test.css".source                 = "${my.theme.cssConfig}/ghostty/dotfiles/test.css";
    xdg.configFile."ghostty/shaders/nyan_cursor.glsl".source = ./dotfiles/shaders/nyan_cursor.glsl;

    # Noctalia theming
    programs.noctalia = {
      settings = {
        theme.templates.user.ghostty = {
          input_path = builtins.toString ./dotfiles/themes/noctalia_theme;
          output_path = "$XDG_CONFIG_HOME/ghostty/themes/noctalia_theme";
          post_hook = "pgrep -f ghostty > /dev/null && pkill -SIGUSR2 ghostty || true";
        };
      };
    };
  };
}
