{
  flake.modules.nixos.efibootmgr = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.efibootmgr
    ];
  };
}
