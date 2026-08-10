{ den, ... }:
let
  aspectName = "gtk-theming";
in
{
  den.aspects.features.theme.${aspectName} = {
    includes = [
      den.aspects.features.desktop.gtk

      {
        homeManager = { lib, ... }: {
          # declare these options in the home manager module (aspect-level doesn't seem to set
          # properly)
          # (specifically, in a parametric inline aspect inside `includes` to make sure
          # that even if we need context args like `userSettings` to *set* these options, we always
          # *declare* them regardless of context, so that other aspects setting these options don't
          # need to require these context args in their home manager class module, which since it's
          # no longer aspect-level will throw an `attribute not found` error instead of skipping
          # when these context args are not in scope)
          options.features.theme.${aspectName} = lib.mkOption {
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

      ({ userSettings }: {
        homeManager = { config, ... }:
          let
            myOpts = config.features.theme;
          in
          {
            gtk = {
              font = {
                name = builtins.head (userSettings.theme.fonts.defaults.sansSerif or [ "" ]);
              };

              gtk3.extraCss = myOpts.${aspectName}.gtk3Css;
              gtk4.extraCss = myOpts.${aspectName}.gtk4Css;
            };
          };
      })
    ];
  };
}
