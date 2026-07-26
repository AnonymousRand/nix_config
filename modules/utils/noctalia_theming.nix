{
  den.aspects.utils.noctalia-theming = {
    homeManager = { user, config, lib, ... }: {
      options = {
        noctaliaTheming = lib.mkOption {
          type = lib.types.submodule {
            options = {
              palette = lib.mkOption {
                type = lib.types.attrsOf lib.types.anything;
                default = {};
              };

              customColors = lib.mkOption {
                type = lib.types.attrsOf lib.types.anything;
                default = {};
              };

              templates = lib.mkOption {
                type = lib.types.attrsOf lib.types.anything;
                default = {};
              };
            };
          };
        };
      };

      config =
        let
          paletteName = user.name;
        in
        lib.mkMerge [
          # declare custom color palette for Noctalia app theming, if provided
          (
            lib.mkIf (lib.attrNames config.noctaliaTheming.palette != []) {
              programs.noctalia = {
                settings.theme = {
                  source = "custom";
                  custom_palette = paletteName;
                };
              };

              xdg.configFile."noctalia/palettes/${paletteName}.json".text =
                builtins.toJSON config.noctaliaTheming.palette;
            }
          )

          {
            programs.noctalia = {
              settings.theme.templates = {
                # load collected custom colors
                custom_colors = config.noctaliaTheming.customColors;
                # load collected templates for rendering
                user = config.noctaliaTheming.templates;
              };
            };
          }
        ];
    };
  };
}
