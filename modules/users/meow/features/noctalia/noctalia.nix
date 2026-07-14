{ inputs, ... }: {
  flake.homeModules.meow = { my, lib, ... }: {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = lib.mkMerge [
        # load custom colors
        my.theme.noctaliaCustomColors
        {
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
            sunrise = "09:00";
            sunset = "18:00";
          };
        }
      ];
    };

    xdg.configFile."noctalia/palettes/anonymousrand.json".text = builtins.toJSON my.theme.colors.m3Palette;
  };
}
