{
  flake.nixosModules.brightnessctl = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.brightnessctl
    ];
  };
}
