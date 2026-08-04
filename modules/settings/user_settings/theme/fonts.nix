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
            };

            freeformType = lib.types.attrsOf lib.types.anything;
          };

          default = {};
        };
      }
    ];
  };
}
