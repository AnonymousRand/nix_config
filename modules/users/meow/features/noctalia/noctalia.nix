{ inputs, ... }: {
  flake.homeModules.meow = { config, ... }:
  
  let
    systemConfig = config;
  in {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = rec {
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
            custom_colors = systemConfig.meow.noctalia-custom-colors;
          };
        };

        # we also put custom colors here as this is what the Noctalia template engine must use
        # when running by itself (e.g. via `noctalia theme` CLI). on the other hand, when Noctalia
        # starts up normally/reloads its config, `theme.templates.custom_colors` is fine since
        # it sort of copies it to its internal `config.custom_colors`
        config.custom_colors = theme.templates.custom_colors;

        location = {
          auto_locate = false;
          sunrise = "09:00";
          sunset = "18:00";
        };
      };
    };

    xdg.configFile."noctalia/palettes/anonymousrand.json".text = builtins.toJSON my.theme.colors.m3-palette;
  };
}
