let
  optsBase = "my";
  aspectName = "noctalia-theming";
in
{
  den.aspects.utils.${aspectName} = {
    homeManager = { user, config, lib, ... }: {
      # declare these options in the home manager class module (aspect-level is weird)
      # set these options on any aspect that includes this :3
      options.${optsBase}.${aspectName} = lib.mkOption {
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

      config =
        let
          paletteName = user.name;
        in
        lib.mkMerge [
          # declare custom color palette for Noctalia app theming, if provided
          (
            lib.mkIf (lib.attrNames config.${optsBase}.${aspectName}.palette != [])
            {
              programs.noctalia = {
                settings.theme = {
                  source = "custom";
                  custom_palette = paletteName;
                };
              };

              xdg.configFile."noctalia/palettes/${paletteName}.json".text =
                builtins.toJSON config.${optsBase}.${aspectName}.palette;
            }
          )

          {
            programs.noctalia = {
              settings.theme.templates = {
                # load collected custom colors
                custom_colors = config.${optsBase}.${aspectName}.customColors;
                # load collected templates for rendering
                user = config.${optsBase}.${aspectName}.templates;
              };
            };
          }
        ];
    };
  };
}
