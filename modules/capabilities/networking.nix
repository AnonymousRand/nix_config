{
  den.schema.host = { lib, ... }: {
    options.capabilities.networking = lib.mkOption {
      type = lib.types.submodule {
        options = {
          supported = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };
        };
      };
    };
  };

  den.aspects.capabilities = {
    nixos = { host, lib, ... }: lib.mkIf (host.capabilities.has [ "networking" ]) {
      # enable network manager
      networking.networkmanager.enable = true;

      # maybe help with wifi issues after suspend
      networking.networkmanager.wifi.powersave = false;
    };
  };
}
