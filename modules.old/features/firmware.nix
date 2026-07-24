{
  flake.modules.nixos.firmware = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.dmidecode
    ];

    services.fwupd.enable = true;
  };
}
