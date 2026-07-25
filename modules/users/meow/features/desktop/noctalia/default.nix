{ den, ... }: {
  meow.features.desktop.noctalia = {
    includes = [
      den.aspects.features.desktop.noctalia
    ];

    homeManager = {
      programs.noctalia = {
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
  };
}
