{ inputs, ... }: {
  flake.modules.homeManager.meow.noctalia = { config, ... }: {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = {
        theme = {
          # declare my custom color palette for Noctalia app theming
          source = "custom";
          custom_palette = "anonymousrand";

          # switch between light and dark themes automatically
          mode = "auto";

          templates = {
            # enable built-in app theming, which uses templates to map
            # Noctalia color palette colors to each app's configs
            enable_builtin_templates = true;
            # load custom colors
            custom_colors = config.meow.theme.colors.vars // config.meow.theme.colors.roles;
          };
        };

        location = {
          auto_locate = false;
          custom_schedule = true;
          sunrise = "09:00";
          sunset = "18:00";
        };
      };
    };

    xdg.configFile."noctalia/palettes/anonymousrand.json".text =
        builtins.toJSON config.meow.theme.colors.m3Palette;
  };
}
