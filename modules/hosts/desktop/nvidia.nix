{
  flake.nixosModules.desktopConfig = {
    hardware.graphics.enable = true;              # enable hardware acceleration
    services.xserver.videoDrivers = [ "nvidia" ]; # load NVIDIA driver to X server
    hardware.nvidia = {
      modesetting.enable = true;     # important for not running into issues especially on Wayland
      powerManagement.enable = true; # can fix suspend/resume issues
      open = true;                   # use open-source NVIDIA kernel module
      nvidiaSettings = true;         # enable NVIDIA settings menu using `nvidia-settings` command
    };
  };
}
