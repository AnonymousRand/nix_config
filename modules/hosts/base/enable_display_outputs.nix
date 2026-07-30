{
  den.schema.host = { lib, ... }: {
    options = {
      # optional `displayOutputs` option in each host entity for WMs/DEs
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
}
