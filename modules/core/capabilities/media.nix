{
  den.schema.syst = { lib, ... }: {
    options.core.capabilities.media = lib.mkOption {
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
      lib.mkIf (core.capabilities.has [ "media" ]) {
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
