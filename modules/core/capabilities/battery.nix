{
  den.schema.syst = { lib, ... }: {
    options.core.capabilities.battery = lib.mkOption {
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

  # (for some reason putting `syst` as an arg to `nixos` here causes infinite recursion)
  den.aspects.core.capabilities = { syst }: {
    nixos = { lib, ... }:
      lib.optionalAttrs (syst.core.capabilities.has [ "battery" ]) {
        # enable battery status feature
        services.upower.enable = true; 
      };
  };
}
