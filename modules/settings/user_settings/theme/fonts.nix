{
  den.aspects.users.base = { config, lib, ... }:
    let
      cfg = config.userSettings.theme.fonts;
      fontList = cfg.list;
    in
    {
      imports = [
        {
          options.userSettings.theme.fonts =
            let
              font = lib.types.submodule ({ name, ... }: {
                options = {
                  size = lib.mkOption {
                    type = lib.types.submodule {
                      options = {
                        default = lib.mkOption {
                          type = lib.types.number;
                        };
                        # workaround for font clipping issues on non-100% scaling; set as needed :3
                        # (this should look the same as the nearest integer to which this rounds)
                        gtk = lib.mkOption {
                          type = lib.types.number;
                          default = fontList.${name}.size.default;
                        };
                      };
                    };
                  };

                  weight = lib.mkOption {
                    type = lib.types.submodule {
                      options = {
                        opentype = lib.mkOption {
                          type = lib.types.int;
                          default = 400;
                        };
                        fontconfig = lib.mkOption {
                          type = lib.types.int;
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
                              builtins.toString fontList.${name}.weight.opentype
                            } or 80;
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

                  def = lib.mkOption {
                    type = lib.types.submodule {
                      options = {
                        general = lib.mkOption {
                          type = lib.types.listOf lib.types.str;
                          default = cfg.defaults.sansSerif;
                        };
                        serif = lib.mkOption {
                          type = lib.types.listOf lib.types.str;
                          default = [];
                        };
                        sansSerif = lib.mkOption {
                          type = lib.types.listOf lib.types.str;
                          default = [];
                        };
                        monospace = lib.mkOption {
                          type = lib.types.listOf lib.types.str;
                          default = [];
                        };
                      };
                    };
                    default = {};
                  };
                };

                default = {};
              };
            };
        }
      ];
    };
}
