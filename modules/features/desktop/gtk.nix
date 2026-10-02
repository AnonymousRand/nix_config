{
  den.aspects.features.desktop.gtk = {
    includes = [
      {
        homeManager = { lib, ... }: {
          # declare these options in the home manager module (aspect-level doesn't seem to work)
          # (specifically, in a parametric inline aspect inside `includes` to make sure that
          # even if we need context args like `profile` to *set* these options, we always *declare*
          # them regardless of context, so that other aspects setting these options don't need
          # to require these context args in their home manager class module, which since it's
          # no longer aspect-level will throw an `attribute not found` error instead of skipping
          # when these context args are not in scope)
          options.aspects.features.desktop.gtk = lib.mkOption {
            type = lib.types.submodule {
              options = {
                gtk3Css = lib.mkOption {
                  type = lib.types.str;
                  default = "";
                };

                gtk4Css = lib.mkOption {
                  type = lib.types.str;
                  default = "";
                };
              };
            };

            default = {};
          };
        };
      }
    ];

    homeManager = { syst, profile, config, lib, ... }:
      lib.mkIf (syst.settings.capabilities.has [ "graphics" ]) {
        gtk =
          let
            hmCfg = config.aspects.features.desktop.gtk;
            fontSettings = profile.settings.theme.fonts;

            fontParams = fontType:
              if (fontSettings.defaults.${fontType} != []) then rec {
                name = builtins.head fontSettings.defaults.${fontType};
                size = fontSettings.list.${name}.size.gtk;
                dconfSizeStr = " ${builtins.toString size}";
              } else {
                name = "";
                size = null;
                dconfSizeStr = "";
              };
            defaultFont = fontParams "general";
            monospaceFont = fontParams "monospace";
          in
          {
            enable = true;
            gtk3.enable = true;
            gtk4.enable = true;

            font = rec {
              name = defaultFont.name;
              size = defaultFont.size;
            };

            gtk3.extraCss = hmCfg.gtk3Css;
            gtk4.extraCss = hmCfg.gtk4Css;
          };
      };
  };
}
