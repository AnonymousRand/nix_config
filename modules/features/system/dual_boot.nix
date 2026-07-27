{
  den.aspects.features.system.dual-boot = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.efibootmgr
      ];
    };
  };
}
