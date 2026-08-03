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

  den.aspects.core.capabilities = {
    nixos = { core, lib, ... }:
      lib.optionalAttrs (core.capabilities.has [ "bluetooth" ]) {
        # enable bluetooth
        hardware.bluetooth.enable = true;
      };
  };
}
