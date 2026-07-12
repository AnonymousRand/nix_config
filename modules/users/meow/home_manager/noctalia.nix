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
            custom_colors = config.custom_colors;
          };
        };

        config = {
          # put custom colors here instead of in `theme.templates` so that template engine
          # can see them when running by itself (e.g. via `noctalia theme` CLI)
          # when run normally with noctalia startup/config loading, `theme.templates` seems to be used
          # instead to render templates, so all changes here must also be copied to `theme.templates`
          custom_colors = systemConfig.meow.colors.color-vars // systemConfig.meow.colors.color-roles;
        };

        location = {
          auto_locate = false;
          sunrise = "09:00";
          sunset = "18:00";
        };
      };
    };

    xdg.configFile."noctalia/palettes/anonymousrand.json".text = builtins.toJSON config.meow.colors.material3-palette;
  };
}
