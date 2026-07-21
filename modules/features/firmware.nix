{
  flake.nixosModules.firmware = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.dmidecode
    ];

    services.fwupd.enable = true;
  };
}
