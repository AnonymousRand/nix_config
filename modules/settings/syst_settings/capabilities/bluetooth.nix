let
  capabilityName = "bluetooth";
in
{
  den.schema.syst = { lib, ... }: {
    options.settings.capabilities.${capabilityName} = lib.mkOption {
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

  den.aspects.syst-settings.capabilities = {
    nixos = { systSettings, lib, ... }:
      lib.mkIf (systSettings.settings.capabilities.has [ capabilityName ]) {
        # enable bluetooth
        hardware.bluetooth.enable = true;
      };
  };
}
