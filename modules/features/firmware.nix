{
  den.aspects.firmware = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.dmidecode
      ];

      services.fwupd.enable = true;
    };
  };
}
