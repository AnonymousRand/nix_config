{
  den.schema.syst = { lib, ... }: {
    options.capabilities.graphics = lib.mkOption {
      type = lib.types.submodule {
        options = {
          supported = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          displayOutputs = lib.mkOption {
            type = lib.types.attrsOf (lib.types.submodule {
              options = {
                resolution = lib.mkOption {
                  type = lib.types.submodule {
                    options.width  = lib.mkOption { type = lib.types.int; };
                    options.height = lib.mkOption { type = lib.types.int; };
                  };
                };
                refreshRate = lib.mkOption { type = lib.types.float; };
                scale       = lib.mkOption { type = lib.types.float; };
                position = lib.mkOption {
                  type = lib.types.submodule {
                    options.x = lib.mkOption { type = lib.types.int; };
                    options.y = lib.mkOption { type = lib.types.int; };
                  };
                };
              };
            });

            default = {};
          };
        };
      };
    };
  };
}
