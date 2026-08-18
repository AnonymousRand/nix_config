let
  capabilityName = "media";
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

  den.aspects.syst-settings.capabilities = {
    nixos = { systSettings, lib, ... }:
      lib.mkIf (systSettings.capabilities.has [ capabilityName ]) {
        # grant real-time audio priority to prevent crackling
        security.rtkit.enable = true;

        # enable pipewire
        services.pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };
      };
  };
}
