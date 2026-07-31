{
  den.aspects.hosts.base = { host, lib, ... }:
    lib.mkIf host.capabilities.battery.supported {
      nixos = {
        # enable battery status feature
        services.upower.enable = true; 
      };
  };
}
