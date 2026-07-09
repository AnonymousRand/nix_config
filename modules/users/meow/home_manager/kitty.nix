{
  flake.homeModules.meow = { config, ... }: {
    programs.kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
      shellIntegration.mode = "no-cursor"; # prevent kitty from overriding fish/vim etc. cursors
      settings = {
        shell = "fish";
        font_size = 12;
      };

      extraConfig = "include themes/noctalia.conf";
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
