{
  den.aspects.features.capabilities.gpu = {
    meta.requiredCapabilities = [ "gpu" ];

    nixos = { host, lib, ... }:
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

        vendorSpecificConfig.${host.capabilities.gpu.vendor}
      ];
  };
}
