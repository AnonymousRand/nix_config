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

  den.aspects.core.capabilities = {
    nixos = { host, lib, ... }: lib.optionalAttrs (host.capabilities.has [ "bluetooth" ]) {
      # enable bluetooth
      hardware.bluetooth.enable = true;
    };
  };
}
