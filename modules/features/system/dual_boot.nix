{
  den.aspects.system.dual-boot = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.efibootmgr
      ];
    };
  };
}
