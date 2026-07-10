{
  flake.homeModules.meow = { config, ... }: {
    programs.kitty = {
      enable = true;
      extraConfig = builtins.readFile ../dotfiles/kitty/kitty.conf +
          "\ninclude themes/noctalia.conf";
    };

    # Noctalia theming
    programs.noctalia = {
      settings = {
        theme.templates = {
          builtin_ids = [ "kitty" ];
        };
      };
    };
  };
}
