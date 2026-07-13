{
  flake.nixosModules.xwayland-satellite = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
