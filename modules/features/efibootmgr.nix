{
  flake.nixosModules.efibootmgr = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      efibootmgr
    ];
  };
}
