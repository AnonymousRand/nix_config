{
  den.schema.host = { lib, ... }: {
    options.capabilities.battery = lib.mkOption {
      type = lib.types.submodule {
        options = {
          supported = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
        };
      };
    };
  };
}
