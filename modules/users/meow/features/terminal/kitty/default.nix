{ den, ... }: {
  meow.features.terminal.kitty =
    let
      noctaliaThemeKittyCfgPath = "themes/noctalia_theme.conf";
    in
    {
      includes = [
        den.aspects.features.terminal.kitty
      ];

      homeManager = {
        programs.kitty = {
          extraConfig = ''
            ${builtins.readFile ./dotfiles/kitty.conf}

            include ${noctaliaThemeKittyCfgPath}
          '';
        };

        # noctalia theming
        programs.noctalia = {
          settings.theme.templates.user.kitty = {
            input_path = builtins.toString ./dotfiles/themes/noctalia_theme.conf;
            output_path = "$XDG_CONFIG_HOME/kitty/${noctaliaThemeKittyCfgPath}";
            post_hook = "kitty +runpy \"from kitty.utils import *; reload_conf_in_all_kitties()\"";
          };
        };
      };
    };
}
