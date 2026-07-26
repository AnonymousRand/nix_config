{ den, ... }: {
  # declare custom options/set default options for all host entities, as metadata used for aspects
  den.schema.host = { host, lib, ... }: {
    options = {
      # required `stateVersion` option in each host entity
      stateVersion = lib.mkOption {
        type = lib.types.str;
      };

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

    config = {
      # change default aspect name associated with host entities to fit our naming scheme
      aspect = den.aspects.hosts.${host.name};
    };
  };
}
