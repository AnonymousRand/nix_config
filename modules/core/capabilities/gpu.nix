{
  den.schema.syst = { lib, ... }: {
    options.core.capabilities.gpu = lib.mkOption {
      type = lib.types.submodule {
        options = {
          supported = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          vendor = lib.mkOption {
            type = lib.types.enum [ "amd" "nvidia" ];
          };
        };
      };
    };
  };

  den.aspects.core.capabilities = { syst }: {
    nixos = { lib, ... }:
      lib.optionalAttrs (syst.core.capabilities.has [ "gpu" ]) (
        let
          vendorSpecificConfig = {
            amd = {};

            nvidia = {
              # load NVIDIA driver to X server
              services.xserver.videoDrivers = [ "nvidia" ];
              hardware.nvidia = {
                modesetting.enable = true;     # can fix some issues esp on wayland
                powerManagement.enable = true; # can fix suspend/resume issues
                open = true;                   # use open-source NVIDIA kernel
                nvidiaSettings = true;         # enable NVIDIA settings
              };
            };
          };
        in
        lib.mkMerge [
          {
            # enable hardware acceleration
            hardware.graphics.enable = true;
          }

          vendorSpecificConfig.${syst.core.capabilities.gpu.vendor}
        ]
      );
  };
}
