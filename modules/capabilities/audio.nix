{
  den.schema.host = { lib, ... }: {
    options.capabilities.audio = lib.mkOption {
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

  den.aspects.capabilities = {
    nixos = { host, lib, ... }: lib.mkIf (host.capabilities.has [ "audio" ]) {
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
