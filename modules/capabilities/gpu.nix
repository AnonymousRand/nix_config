{
  den.schema.host = { lib, ... }: {
    options.capabilities.gpu = lib.mkOption {
      type = lib.types.submodule {
        options = {
          supported = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          vendor = lib.mkOption {
            type = lib.types.enum [ "amd" "nvidia" ];
          };
        };
      };
    };
  };
}
