{ den, ... }: import ../../../_host_agnostic_user_entity.nix {
  usrSettings.theme.fonts.defaults.general = builtins.trace "kitty 1!" [ "Quicksand Medium" ];
} // {
  meow.features.terminal.kitty = builtins.trace "kitty 2!" {
    includes = [
      den.aspects.features.terminal.kitty
    ];

    homeManager =
      let
        noctaliaThemeKittyCfgPath = "themes/noctalia_theme.conf";
      in
      {
        programs.kitty = {
          extraConfig = ''
            ${builtins.readFile ./dotfiles/kitty.conf}

            include ${noctaliaThemeKittyCfgPath}
          '';
        };

        # noctalia theming
        utils.theme.noctalia-theming.templates.kitty = {
          input_path = builtins.toString ./dotfiles/themes/noctalia_theme.conf;
          output_path = "$XDG_CONFIG_HOME/kitty/${noctaliaThemeKittyCfgPath}";
          post_hook = "kitty +runpy \"from kitty.utils import *; reload_conf_in_all_kitties()\"";
        };
      };
  };
}
