{
  den.schema.syst = { lib, ... }: {
    options.core.capabilities.bluetooth = lib.mkOption {
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

  den.aspects.core.capabilities = { syst }: {
    nixos = { lib, ... }:
      lib.optionalAttrs (syst.core.capabilities.has [ "bluetooth" ]) {
        # enable bluetooth
        hardware.bluetooth.enable = true;
      };
  };
}
