{
  den.aspects.utils.noctalia-theming = { config, lib, ... }: {
    imports = [
      {
        # declare these aspect-level options (requires the `imports` above to work)
        # set these options on any aspect that includes this :3
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
      }
    ];

    homeManager = { user, ... }:
    let
      paletteName = user.name;
    in
    {
      config = lib.mkMerge [
        # declare custom color palette for Noctalia app theming, if provided
        (
          lib.mkIf (lib.attrNames config.palette != [])
          {
            programs.noctalia = {
              settings.theme = {
                source = "custom";
                custom_palette = paletteName;
              };
            };

            xdg.configFile."noctalia/palettes/${paletteName}.json".text =
              builtins.toJSON config.palette;
          }
        )

        {
          programs.noctalia = {
            settings.theme.templates = {
              # load collected custom colors
              custom_colors = config.customColors;
              # load collected templates for rendering
              user = config.templates;
            };
          };
        }
      ];
    };
  };
}
