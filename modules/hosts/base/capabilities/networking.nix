{
  den.aspects.hosts.base = { host, lib, ... }:
    lib.mkIf host.capabilities.networking.supported {
      nixos = {
        # enable network manager
        networking.networkmanager.enable = true;

        # maybe help with wifi issues after suspend
        networking.networkmanager.wifi.powersave = false;
      };
    };
}
