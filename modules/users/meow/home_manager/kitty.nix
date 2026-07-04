{
  flake.homeModules.meow = { config, ... }: {
    programs.kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
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
