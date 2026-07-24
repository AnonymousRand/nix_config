{
  den.aspects.dual-boot = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.efibootmgr
      ];
    };
  };
}
