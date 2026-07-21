{
  flake.nixosModules.htop = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.htop
    ];
  };
}
