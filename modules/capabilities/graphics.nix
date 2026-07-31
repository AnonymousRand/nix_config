{
  den.schema.host = { lib, ... }: {
    options.capabilities.graphics = lib.mkOption {
      type = lib.types.submodule {
        options = {
          supported = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          displayProtocol = lib.mkOption {
            type = lib.types.nullOr (lib.types.enum [ "wayland" "x11" ]);
            default = null;
          };

          displayOutputs = lib.mkOption {
            type = lib.types.listOf (lib.types.submodule {
              options = {
                name       = lib.mkOption { type = lib.types.str; };
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

            default = [];
          };
        };
      };
    };
  };
}
