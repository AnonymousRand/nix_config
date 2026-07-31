{
  den.aspects.hosts.base = { host, lib, ... }:
    lib.mkIf host.capabilities.gpu.supported {
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
      nixos = lib.mkMerge [
        {
          # enable hardware acceleration
          hardware.graphics.enable = true;
        }

        vendorSpecificConfig.${host.capabilities.gpu.vendor}
      ];
    };
}
