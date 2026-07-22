{
  flake.homeModules.meow = { config, ... }: {
    programs.kitty = {
      enable = true;
      extraConfig = builtins.readFile ./dotfiles/kitty.conf +
          "\ninclude themes/noctalia_theme.conf";
    };

    # Noctalia theming
    programs.noctalia = {
      settings = {
        theme.templates.user.kitty = {
          input_path = builtins.toString ./dotfiles/themes/noctalia_theme.conf;
          output_path = "$XDG_CONFIG_HOME/kitty/themes/noctalia_theme.conf";
          post_hook = "kitty +runpy \"from kitty.utils import *; reload_conf_in_all_kitties()\"";
        };
      };
    };
  };
}
