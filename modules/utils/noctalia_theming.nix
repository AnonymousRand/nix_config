{ den, ... }:
let
  aspectName = "noctalia-theming";
in
{
  den.aspects.utils.${aspectName} = {
    includes = [
      den.aspects.features.desktop.noctalia
    ];

    homeManager = { username, config, lib, ... }: {
      # declare these options in the home manager module (aspect-level doesn't seem to set properly)
      # set these options on any aspect that includes this :3
      options.utils.${aspectName} = lib.mkOption {
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

      config = lib.mkMerge [
        # declare custom color palette for Noctalia app theming, if provided
        (
          lib.mkIf (lib.attrNames config.utils.${aspectName}.palette != [])
          {
            programs.noctalia = {
              settings.theme = {
                source = "custom";
                custom_palette = username;
              };
            };

            xdg.configFile."noctalia/palettes/${username}.json".text =
              builtins.toJSON config.utils.${aspectName}.palette;
          }
        )

        {
          programs.noctalia = {
            settings.theme.templates = {
              # load collected custom colors
              custom_colors = config.utils.${aspectName}.customColors;
              # load collected templates for rendering
              user = config.utils.${aspectName}.templates;
            };
          };
        }
      ];
    };
  };
}
