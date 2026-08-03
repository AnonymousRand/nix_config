let
  capabilityName = "bluetooth";
in
{
  den.schema.syst = { lib, ... }: {
    options.core.capabilities.${capabilityName} = lib.mkOption {
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
      lib.mkIf (core.capabilities.has [ capabilityName ]) {
        # enable bluetooth
        hardware.bluetooth.enable = true;
      };
  };
}
