{
  den.schema.syst = { lib, ... }: {
    options.core.capabilities.brightness = lib.mkOption {
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
