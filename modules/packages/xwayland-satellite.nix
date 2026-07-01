{
  flake.nixosModules.xwayland-satelitte = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
