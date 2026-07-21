{
  flake.nixosModules.bottom = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.bottom
    ];
  };
}
