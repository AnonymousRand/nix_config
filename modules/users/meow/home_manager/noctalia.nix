{ inputs, ... }: {
  flake.homeModules.meow = { config, ... }: {
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

          templates = {
            # enable built-in app theming, which uses templates to map
            # Noctalia color palette colors to each app's configs
            enable_builtin_templates = true;

            custom_colors = config.meow.colors.color-vars // config.meow.colors.color-roles;
          };
        };
      };
    };

    xdg.configFile."noctalia/palettes/anonymousrand.json".text = builtins.toJSON config.meow.colors.material3-palette;
  };
}
