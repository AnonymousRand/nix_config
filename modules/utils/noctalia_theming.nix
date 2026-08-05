{ den, ... }:
let
  aspectName = "noctalia-theming";
in
{
  den.aspects.utils.${aspectName} = { userSettings }: {
    includes = [
      den.aspects.features.desktop.noctalia
    ];

    homeManager = { config, lib, ... }: {
      # declare these options in the home manager module (aspect-level doesn't seem to set
      # properly)
      # (specifically, in a parametric inline aspect inside `includes` to make sure
      # that even if we need context args like `userSettings` to *set* these options, we always
      # *declare* them regardless of context, so that other aspects setting these options don't
      # need to require these context args in their home manager class module, which since it's
      # no longer aspect-level will throw an `attribute not found` error instead of skipping
      # when these context args are not in scope)
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

      config =
        let
          paletteName = userSettings.username;
        in
        lib.mkMerge [
          # declare custom color palette for Noctalia app theming, if provided
          (lib.mkIf (lib.attrNames config.utils.${aspectName}.palette != []) {
            programs.noctalia = {
              settings.theme = {
                source = "custom";
                custom_palette = paletteName;
              };
            };

            xdg.configFile."noctalia/palettes/${paletteName}.json".text =
              builtins.toJSON config.utils.${aspectName}.palette;
          })

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
