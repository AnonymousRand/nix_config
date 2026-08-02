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

  den.aspects.capabilities = {
    nixos = { host, lib, ... }: lib.mkIf host.capabilities.bluetooth.supported {
      # enable bluetooth
      hardware.bluetooth.enable = true;
    };
  };
}
