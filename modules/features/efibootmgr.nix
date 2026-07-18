{
  flake.nixosModules.efibootmgr = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.efibootmgr
    ];
  };
}
