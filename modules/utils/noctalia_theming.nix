{
  den.aspects.utils.noctalia-theming = {
    # TODO: try making this aspect level as well, and set through den.aspects.utils.noctalia-theming.*
    # from aspect level? see if that is too awkward
    homeManager = { user, config, lib, ... }: {
      # declare these options (inside home manager class module instead of at aspect level to make
      # it easier to access from within home manager class modules of feature aspects)
      #
      # set these options on any aspect that includes this :3
      options.noctaliaTheming = lib.mkOption {
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
