{
  den.aspects.users.base = { lib, ... }: {
    imports = [
      {
        options.userSettings.theme.fonts = lib.mkOption {
          type = lib.types.submodule {
            options = {
              defaults = lib.mkOption {
                type = lib.types.submodule {
                  options = {
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

              sizes = lib.mkOption {
                type = lib.types.submodule {
                  options = {
                    normal = lib.mkOption {
                      type = lib.types.number;
                      default = 12;
                    };

                    # workaround for font clipping issues on non-100% scaling; set as needed
                    # (this should look the same as the nearest integer to which this rounds)
                    normalGtk = lib.mkOption {
                      type = lib.types.number;
                      default = 12.1;
                    };
                  };
                };
              };
            };

            freeformType = lib.types.attrsOf lib.types.anything;
          };

          default = {};
        };
      }
    ];
  };
}
