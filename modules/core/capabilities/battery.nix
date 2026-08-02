{
  den.schema.syst = { lib, ... }: {
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

  den.aspects.core.capabilities = {
    nixos = { host, lib, ... }: lib.optionalAttrs (host.capabilities.has [ "battery" ]) {
      # enable battery status feature
      services.upower.enable = true; 
    };
  };
}
