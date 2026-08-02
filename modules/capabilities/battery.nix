{
  den.schema.host = { lib, ... }: {
    options.capabilities.battery = lib.mkOption {
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
    nixos = { host, lib, ... }: lib.mkIf host.capabilities.battery.supported {
      # enable battery status feature
      services.upower.enable = true; 
    };
  };
}
