{
  den.schema.syst = { lib, ... }: {
    options.core.capabilities.networking = lib.mkOption {
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
      lib.optionalAttrs (core.capabilities.has [ "networking" ]) {
        # enable network manager
        networking.networkmanager.enable = true;

        # maybe help with wifi issues after suspend
        networking.networkmanager.wifi.powersave = false;
      };
  };
}
