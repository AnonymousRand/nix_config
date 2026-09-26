let
  capabilityName = "gpu";
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

          vendor = lib.mkOption {
            type = lib.types.enum [ "amd" "nvidia" ];
          };
        };
      };
    };
  };

  den.aspects.syst-settings.capabilities = {
    nixos = { syst, lib, ... }:
      lib.mkIf (syst.settings.capabilities.has [ capabilityName ]) (builtins.trace "has? ${(builtins.toString syst.settings.capacbilities.has [capabilityName])}" (
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

          vendorSpecificConfig.${syst.settings.capabilities.${capabilityName}.vendor}
        ]
      ));
  };
}
