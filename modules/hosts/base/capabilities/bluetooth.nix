{
  den.aspects.hosts.base = { host, lib, ... }:
    lib.mkIf host.capabilities.bluetooth.supported {
      nixos = {
        # enable bluetooth
        hardware.bluetooth.enable = true;
      };
    };
}
