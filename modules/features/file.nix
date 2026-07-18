{
  flake.nixosModules.file = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.file
    ];
  };
}
