let
  capabilityName = "gpu";
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

          vendor = lib.mkOption {
            type = lib.types.enum [ "amd" "nvidia" ];
          };
        };
      };
    };
  };

  den.aspects.syst-settings.capabilities = { systSettings }: {
    nixos = { lib, ... }: lib.mkIf (systSettings.capabilities.has [ capabilityName ]) (
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

        vendorSpecificConfig.${systSettings.capabilities.${capabilityName}.vendor}
      ]
    );
  };
}
