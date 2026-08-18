{
  den.schema.usr = { config, lib, ... }:
    let
      aspCfg = config.usrSettings.theme.fonts;
      fontList = aspCfg.list;
    in
    {
      options.usrSettings.theme.fonts =
        let
          font = lib.types.submodule ({ name, ... }: {
            options = {
              size = lib.mkOption {
                type = lib.types.submodule {
                  options = {
                    normal = lib.mkOption {
                      # use `null` for default font sizes
                      type = lib.types.nullOr lib.types.number;
                      default = null;
                    };
                    # workaround for font clipping issues on non-100% scaling; set as needed :3
                    # (this should look the same as the nearest integer to which this rounds)
                    gtk = lib.mkOption {
                      type = lib.types.nullOr lib.types.number;
                      default = fontList.${name}.size.normal;
                    };
                  };
                };
              };

              weight = lib.mkOption {
                type = lib.types.submodule {
                  options = {
                    opentype = lib.mkOption {
                      type = lib.types.nullOr lib.types.int;
                      default = null;
                    };
                    fontconfig = lib.mkOption {
                      type = lib.types.nullOr lib.types.int;
                      default =
                        let
                          # conversion table from https://stackoverflow.com/a/70011705
                          opentypeToFontconfig = {
                            "0"    = 0;
                            "100"  = 0;
                            "200"  = 40;
                            "300"  = 50;
                            "350"  = 55;
                            "380"  = 75;
                            "400"  = 80;
                            "500"  = 100;
                            "600"  = 180;
                            "700"  = 200;
                            "800"  = 205;
                            "900"  = 210;
                            "1000" = 215;
                          };
                        in
                        opentypeToFontconfig.${
                          builtins.toString fontList.${name}.weight.opentype or null
                        } or null;
                    };
                  };
                };
                default = {};
              };

              enabledFontFeatures = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                default = [];
              };

              disabledFontFeatures = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                default = [];
              };
            };
          });
        in
        lib.mkOption {
          type = lib.types.submodule {
            options = {
              list = lib.mkOption {
                type = lib.types.attrsOf font;
                default = {};
              };

              defaults = lib.mkOption {
                type = lib.types.submodule {
                  options =
                    # make sure that the default fonts are also in `usrSettings.theme.fonts.list`
                    # (so that their config options can be referenced without worry, for example)
                    let
                      areFontsInFontList = fonts:
                        builtins.foldl' (acc: elem: acc && (fontList ? ${elem})) true fonts;

                      validationTmpl = val: fontType:
                        if (areFontsInFontList val) then
                          val
                        else
                          throw (
                            "den.schema.usr.usrSettings.theme.fonts: the value "
                            + "[ \"${builtins.concatStringsSep "\" \"" val}\" ] "
                            + "passed to `usrSettings.theme.fonts.defaults.${fontType}` "
                            + "contains a font not listed in `usrSettings.theme.fonts.list`!"
                          );
                    in
                    {
                      general = lib.mkOption {
                        type = lib.types.listOf lib.types.str;
                        default = aspCfg.defaults.sansSerif;
                        apply = val: validationTmpl val "general";
                      };
                      serif = lib.mkOption {
                        type = lib.types.listOf lib.types.str;
                        # note: these defaults are not just empty lists since we may need to call
                        # `builtins.head` on them
                        default = [ "" ];
                        apply = val: validationTmpl val "serif";
                      };
                      sansSerif = lib.mkOption {
                        type = lib.types.listOf lib.types.str;
                        default = [ "" ];
                        apply = val: validationTmpl val "sansSerif";
                      };
                      monospace = lib.mkOption {
                        type = lib.types.listOf lib.types.str;
                        default = [ "" ];
                        apply = val: validationTmpl val "monospace";
                      };
                    };
                };

                default = {};
              };
            };
          };

          default = {};
        };
    };
}
