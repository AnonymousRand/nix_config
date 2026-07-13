{
  flake.nixosModules.brightnessctl = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      brightnessctl
    ];
  };
}
