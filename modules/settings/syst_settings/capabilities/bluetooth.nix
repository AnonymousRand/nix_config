let
  capabilityName = "bluetooth";
in
{
  den.schema.syst = { lib, ... }: {
    options.systSettings.capabilities.${capabilityName} = lib.mkOption {
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

  den.aspects.syst-settings.capabilities = { systSettings }: {
    nixos = { lib, ... }: lib.mkIf (systSettings.capabilities.has [ capabilityName ]) {
      # enable bluetooth
      hardware.bluetooth.enable = true;
    };
  };
}
