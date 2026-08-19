{ den, ... }: import ../../../_cfg_all_profiles_for_user.nix {
  profileSettings.theme.fonts.defaults.general = [ "Quicksand Medium" ];
} // {
  meow.features.terminal.kitty = {
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
