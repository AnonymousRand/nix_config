{
  flake.nixosModules.xwayland-satellite = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.xwayland-satellite
    ];
  };
}
