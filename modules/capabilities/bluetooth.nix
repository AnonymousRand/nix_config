{
  den.schema.host = { lib, ... }: {
    options.capabilities.bluetooth = lib.mkOption {
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
