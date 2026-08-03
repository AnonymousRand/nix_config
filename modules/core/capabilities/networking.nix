let
  capabilityName = "networking";
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
        # enable network manager
        networking.networkmanager.enable = true;

        # maybe help with wifi issues after suspend
        networking.networkmanager.wifi.powersave = false;
      };
  };
}
