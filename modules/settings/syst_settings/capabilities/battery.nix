let
  capabilityName = "battery";
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

  # (for some reason putting `syst` as an arg to `nixos` here causes infinite recursion)
  den.aspects.syst-settings.capabilities = {
    nixos = { systSettings, lib, ... }:
      lib.mkIf (systSettings.capabilities.has [ capabilityName ]) {
        # enable battery status feature
        services.upower.enable = true; 
      };
  };
}
