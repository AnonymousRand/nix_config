{
  den.aspects.nvidia = {
    nixos = {
      hardware.graphics.enable = true;              # enable hardware acceleration
      services.xserver.videoDrivers = [ "nvidia" ]; # load NVIDIA driver to X server
      hardware.nvidia = {
        modesetting.enable = true;     # important for avoiding issues esp on wayland
        powerManagement.enable = true; # can fix suspend/resume issues
        open = true;                   # use open-source NVIDIA kernel module
        nvidiaSettings = true;         # enable NVIDIA settings using `nvidia-settings`
      };
    };
  };
}
