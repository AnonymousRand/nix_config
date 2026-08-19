{ den, ... }:
let
  aspectName = "gtk-theming";
in
{
  den.aspects.batteries.theme.${aspectName} = {
    includes = [
      den.aspects.features.desktop.gtk

      {
        homeManager = { lib, ... }: {
          # declare these options in the home manager module (aspect-level doesn't seem to work)
          # (specifically, in a parametric inline aspect inside `includes` to make sure
          # that even if we need context args like `profileSettings` to *set* these options, we always
          # *declare* them regardless of context, so that other aspects setting these options don't
          # need to require these context args in their home manager class module, which since it's
          # no longer aspect-level will throw an `attribute not found` error instead of skipping
          # when these context args are not in scope)
          options.batteries.theme.${aspectName} = lib.mkOption {
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

    homeManager = { profileSettings, config, lib, ... }:
      let
        hmCfg = config.batteries.theme.${aspectName};
        fontSettings = profileSettings.theme.fonts;

        fontParams = fontType:
          if (fontSettings.defaults.${fontType} != []) then rec {
            name = builtins.head (fontSettings.defaults.${fontType});
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
        gtk = {
          font = rec {
            name = defaultFont.name;
            size = defaultFont.size;
          };

          gtk3.extraCss = hmCfg.gtk3Css;
          gtk4.extraCss = hmCfg.gtk4Css;
        };

        # this is needed for some things (e.g. libadwaita apps?) for which `gtk` above doesn't work
        dconf.settings = {
          "org/gnome/desktop/interface" = rec {
            # note: if `defaultFont.size` is `null`, `builtins.toString` should evaluate it
            # to an empty string
            font-name = "${defaultFont.name}${defaultFont.dconfSizeStr}";
            document-font-name = font-name;
            monospace-font-name = "${monospaceFont.name}${monospaceFont.dconfSizeStr}";
          };
        };
      };
  };
}
